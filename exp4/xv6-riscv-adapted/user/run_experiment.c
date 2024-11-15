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

    int memory_time = 0;

    // --- Declaring and initializing variables related to the throughput metric ---
    int *throughputs = malloc(NUM_ROUNDS * sizeof(int));

    char file_path[] = "output.txt";

    int sum_throughput = 0;             // Holds the sum of the throughput values through the whole experiment

    // --- Executing 30 rounds of the experiment ---
    for (int i = 0; i < NUM_ROUNDS; i++) {
        // --- STARTING NEW ROUND ---
        printf("####### STARTING ROUND %d #######\n", (i + 1));
        execs_cpu = (random() % 9) + 6;
        execs_io = 20 - execs_cpu;
        const_execs_io = execs_io;

        // --- TEST VALUES ---
        // execs_cpu = random() % 3 + 1;
        // execs_io = 6 - execs_cpu;
        // int const_execs_io = execs_io;

        // --- EFFICIENCY METRIC VARIABLES ---
        int efficiency = 0;                             // Efficiency value multiplied by 100

        // --- THROUGHPUT METRIC VARIABLES ---
        int process_count_sec = 0;                      // Number of processses completed during one second
        int count_ticks = 0;                            // Number of seconds passed during the experiment
        int start_time = uptime();                      // Record start time of the round
        int d_time_new;
        int d_time_old = start_time;                    // Number of ticks before one second 
        int max_throughput = 0;
        int min_throughput = __INT32_MAX__;

        int total_processes = execs_cpu + execs_io;     // Number of processes that will be executed through the round

        while (execs_cpu > 0 || execs_io > 0) {

            // --- CPU BOUND ---
            if (execs_cpu > 0) {
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
                process_count_sec = 0;
                count_ticks += (d_time_new - d_time_old);
                d_time_old = d_time_new;
            }

            // --- IO BOUND ---
            if (execs_io > 0) {
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
                process_count_sec = 0;
                count_ticks += (d_time_new - d_time_old);
                d_time_old = d_time_new;
            }
        }

        // --- CALCULATING NON-NORMALIZED THROUGHPUT VALUES OF THE FINISHED ROUND ---
        throughputs[i] = (total_processes * 10000) / count_ticks;   // Throughput of the round
        sum_throughput += throughputs[i];                           // Adding the throughput of the round into the sum of throughput values of the experiment
        int avg_throughput = (sum_throughput / (i + 1));            // Adjusting avg_throughput to consider this round

        if (max_throughput == min_throughput) {
            // Adjusting to guarantee non-zero division
            max_throughput++;
        }

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