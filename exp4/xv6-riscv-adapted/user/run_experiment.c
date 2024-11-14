#include "cpu-bound.h"
#include "io-bound.h"
#include "metrics.h"
#include "../kernel/types.h"
#include "user.h"

#define EXIT_SUCCESS 0

void print_float(int value) {
    printf("%d.%d\n", (value / 100), (value % 100));
}

int main(int argc, char *argv[]) {
    int execs_cpu;
    int execs_io;

    // --- Declaring and initializing variables related to the throughput metric ---
    int *throughputs = malloc(NUM_ROUNDS * sizeof(int));

    char file_path[] = "output.txt";

    int sum_throughput = 0;             // Holds the sum of the throughput values through the whole experiment

    // --- Executing 30 rounds of the experiment ---
    for (int i = 0; i < NUM_ROUNDS; i++) {
        printf("ROUND: %d\n", i);
        // DO NOT ERASE THE COMENTS BELOW, i commented so i could use smaller numbers and get faster executions
        // also changed num_rounds for 3 instead of 30 

        // execs_cpu = (random() % 9) + 6;
        // execs_io = 20 - execs_cpu;

        // --- EFFICIENCY METRIC VARIABLES ---
        int efficiency = 0;                 // Efficiency value multiplied by 100 

        // --- THROUGHPUT METRIC VARIABLES ---
        int process_count_sec = 0;          // Number of processses completed during one second
        int count_ticks = 0;                // Number of seconds passed during the experiment
        int start_time = uptime();          // Record start time of the round
        int d_time_new;
        int d_time_old = start_time;        // Number of ticks before one second 
        int max_throughput = 0;
        int min_throughput = __INT32_MAX__;

        execs_cpu = random() % 3 + 1;
        execs_io = 6 - execs_cpu;
        int total_processes = execs_cpu + execs_io;


        printf("EXECS CPU: %d / EXECS IO: %d\n", execs_cpu, execs_io);
        while (execs_cpu > 0 || execs_io > 0) {

            // --- CPU BOUND ---
            if (execs_cpu > 0) {
                // Executing one iteration of CPU-bound
                int p = fork();
                int status;
                if (p == 0) {
                    printf("starting cpu\n");
                    cpu_bound();
                    exit(EXIT_SUCCESS);
                }
                wait(&status);
                execs_cpu--;
                process_count_sec++;
                printf("finished for cpu now %d\n", execs_cpu);
            }

            // --- Adjusting min/max throughput values ---
            d_time_new = uptime();
            if ((d_time_new - d_time_old) > 100) {
                printf("passed one second with d_time_new = %d and dtime_old = %d\n", d_time_new, d_time_old);
                // one second passed by
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
                // Executing one iteration of IO-bound
                int p = fork();
                int status;
                if (p == 0) {
                    printf("starting io\n");
                    io_bound(file_path, &efficiency);
                    exit(EXIT_SUCCESS);
                }
                wait(&status);
                execs_io--;
                process_count_sec++;
                printf("finished for io now %d\n", execs_io);
            }

            // --- Adjusting min/max throughput values ---
            d_time_new = uptime();
            if ((d_time_new - d_time_old) > 100) {
                printf("passed one second with d_time_new = %d and dtime_old = %d\n", d_time_new, d_time_old);
                // one second passed by
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

        // --- Calculating throughput values of the finished round ---
        throughputs[i] = (total_processes * 10000) / count_ticks;   // Throughput of the round
        sum_throughput += throughputs[i];                           // Adding the throughput of the round into the sum of throughput values of the experiment
        int avg_throughput = (sum_throughput / (i + 1));            // Adjusting avg_throughput to consider this round

        if (max_throughput == min_throughput) {
            // Adjusting to guarantee non-zero division
            max_throughput++;
        }
        printf("minthrought = %d and maxthroughput = %d\n", min_throughput, max_throughput);
        printf("throughput of the round %d\n", throughputs[i]);
        printf("sumthroughput %d\n", sum_throughput);
        printf("avgthroughput %d\n", avg_throughput);
        printf("before norm %d\n", ((avg_throughput - min_throughput) * 100) / (max_throughput - min_throughput));

        int norm_throughput = 100 - (((avg_throughput - min_throughput) * 100) / (max_throughput - min_throughput));
        printf("normalized throughput of round %d is = ", i);
        print_float(norm_throughput);

        // --- Printing efficiency values ---
        printf("efficiency before float: %d\n", efficiency);
        printf("EFFICIENCY: ");
        print_float(efficiency);
    } 
    free(throughputs);

    return 0;
}