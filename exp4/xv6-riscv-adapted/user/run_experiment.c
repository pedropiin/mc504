#include "cpu-bound.h"
#include "io-bound.h"
#include "metrics.h"
#include "../kernel/types.h"
#include "user.h"

#define EXIT_SUCCESS 0

void print_float(int value) {
    if (value < 10) {
        printf("0.0%d\n", value);
    } else {
        printf("%d.%d\n", (value / 100), (value % 100));
    }
}

int main(int argc, char *argv[]) {
    int execs_cpu;
    int execs_io;
    int const_execs_io;

    // --- Declaring and initializing variables related to the throughput metric ---
    int *throughputs = malloc(NUM_ROUNDS * sizeof(int) * 2);

    char file_path[] = "output.txt";


    // --- Executing 30 rounds of the experiment ---
    for (int i = 0; i < NUM_ROUNDS; i++) {
        // --- STARTING NEW ROUND ---
        printf("####### STARTING ROUND %d #######\n", (i + 1));
        // execs_cpu = (random() % 9) + 6;
        // execs_io = 20 - execs_cpu;
        // const_execs_io = execs_io;

        // --- TEST VALUES ---
        execs_cpu = random() % 3 + 1;
        execs_io = 6 - execs_cpu;
        const_execs_io = execs_io;

        // --- THROUGHPUT METRIC VARIABLES ---
        int process_count_sec = 0;                          // Number of processses completed during one second
        int count_throughs = 0;
        int sum_throughput = 0;                             // Holds the sum of the throughput values through the whole experiment
        int avg_throughput;
        int count_ticks = 0;                                // Number of seconds passed during the experiment
        int start_time = uptime();                          // Record start time of the round
        int d_time_new;
        int d_time_old = start_time;                        // Number of ticks before one second 

        int max_throughput = 0;
        int min_throughput = __INT32_MAX__;

        // --- EFFICIENCY METRIC VARIABLES ---
        int efficiency = 0;                                 // Efficiency value multiplied by 100

        // --- JUSTICE METRIC VARIABLES ---
        int justice;
        int time_processes = 0;                             // Number of ticks that the processes take to complete
        int time_processes_sq = 0;
        int tick_count_before_p;
        int tick_count_after_p;

        int total_process_count = execs_cpu + execs_io;     // Number of processes that will be executed through the round

        while (execs_cpu > 0 || execs_io > 0) {

            // --- CPU BOUND ---
            if (execs_cpu > 0) {
                // Setting tick count
                tick_count_before_p = uptime();

                // Dealing with fork and child process
                int p = fork();
                int status;
                if (p == 0) {
                    // Executing one iteration of cpu_bound
                    cpu_bound();
                    exit(EXIT_SUCCESS);
                }
                wait(&status);

                // Adjusting counter variables
                execs_cpu--;
                process_count_sec++;

                // Adjusting tick count for the whole process
                tick_count_after_p = uptime();
                time_processes += tick_count_after_p - tick_count_before_p;
                time_processes_sq += (tick_count_after_p - tick_count_before_p) * (tick_count_after_p - tick_count_before_p);
            }

            // --- Adjusting min/max throughput values ---
            d_time_new = uptime();
            if ((d_time_new - d_time_old) > 100) {
                // At least one second passed by
                int temp = (process_count_sec * 10000) / (d_time_new - d_time_old);
                if (temp > max_throughput) {
                    max_throughput = temp;
                }
                if (temp < min_throughput) {
                    min_throughput = temp;
                }
                throughputs[count_throughs] = temp;
                count_throughs++;
                process_count_sec = 0;
                count_ticks += (d_time_new - d_time_old);
                d_time_old = d_time_new;
            }

            // --- IO BOUND ---
            if (execs_io > 0) {
                // Setting tick count
                tick_count_before_p = uptime();

                // Creating pipe to pass values from child process to parent
                int *fd = malloc(sizeof(int) * 2);
                pipe(fd);
                
                // Dealing with fork and child process
                int p = fork();
                int status;
                if (p == 0) {
                    close(fd[0]);
                    // Executing one iteration of IO-bound
                    io_bound(file_path, &efficiency);
                    
                    // Passing efficiency value to pipe and closing file descriptor
                    write(fd[1], &efficiency, sizeof(efficiency));
                    close(fd[1]);
                    exit(EXIT_SUCCESS);
                }
                // Getting efficiency value from pipe and closing file descriptor
                close(fd[1]);
                read(fd[0], &efficiency, sizeof(efficiency));
                close(fd[0]);
                wait(&status);

                // Adjusting counter variables
                execs_io--;
                process_count_sec++;

                // Adjusting tick count for the whole process
                tick_count_after_p = uptime();
                time_processes += tick_count_after_p - tick_count_before_p;
                time_processes_sq += (tick_count_after_p - tick_count_before_p) * (tick_count_after_p - tick_count_before_p);
            }

            // --- Adjusting min/max throughput values ---
            d_time_new = uptime();
            if ((d_time_new - d_time_old) > 100) {
                // At least one second passed by
                int temp = (process_count_sec * 10000) / (d_time_new - d_time_old);
                if (temp > max_throughput) {
                    max_throughput = temp;
                }
                if (temp < min_throughput) {
                    min_throughput = temp;
                }
                throughputs[count_throughs] = temp;
                count_throughs++;
                process_count_sec = 0;
                count_ticks += (d_time_new - d_time_old);
                d_time_old = d_time_new;
            }
        }

        // --- CALCULATING NON-NORMALIZED THROUGHPUT VALUES OF THE FINISHED ROUND ---
        for (int j = 0; j < count_throughs; j++) {
            sum_throughput += throughputs[j];
        }
        avg_throughput = sum_throughput / count_throughs;

        if (max_throughput == min_throughput) {
            // Adjusting to guarantee non-zero division
            max_throughput++;
        }

        // --- CALCULATING AND PRINTING JUSTICE METRIC ---
        justice = ((time_processes * time_processes) * 100) / (total_process_count * time_processes_sq);
        printf("JUSTICE BETWEEN PROCESSES: ");
        print_float(justice);

        // --- PRINTING NORMALIZED THROUGHPUT ---
        int norm_throughput = 100 - (((avg_throughput - min_throughput) * 100) / (max_throughput - min_throughput));
        printf("NORMALIZED THROUGHPUT: ");
        print_float(norm_throughput);

        // --- CALCULATING AVERAGE AND PRINTING EFFICIENCY ---
        efficiency /= const_execs_io;
        printf("FILE SYSTEM EFFICIENCY: ");
        print_float(efficiency);

        // --- ENDING CURRENT ROUND ---
        printf("####### FINISHED ROUND %d #######\n\n", (i + 1));
    } 
    free(throughputs);

    return 0;
}