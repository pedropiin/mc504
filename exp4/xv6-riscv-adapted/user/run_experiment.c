#include "cpu-bound.h"
#include "io-bound.h"
#include "metrics.h"
#include "../kernel/types.h"
#include "user.h"

#define EXIT_SUCCESS 0


int main(int argc, char *argv[]) {
    int execs_cpu;
    int execs_io;

    // --- Declaring and initializing variables related to the throughput metric ---
    int *throughputs = malloc(NUM_ROUNDS * sizeof(int));
    int max_throughput = 0;
    int min_throughput = __INT32_MAX__;

    char file_path[] = "output.txt";

    int sum_throughput = 0;             // Holds the sum of the throughput values through the whole experiment

    // --- Executing 30 rounds of the experiment ---
    for (int i = 0; i < NUM_ROUNDS; i++) {
        printf("ROUND: %d\n", i);
        // DO NOT ERASE THE COMENTS BELOW, i commented so i could use smaller numbers and get faster executions
        // also changed num_rounds for 3 instead of 30 

        // execs_cpu = (random() % 9) + 6;
        // execs_io = 20 - execs_cpu;

        execs_cpu = random() % 3 + 1;
        execs_io = 6 - execs_cpu;
        int total_processes = execs_cpu + execs_io;

        int process_count_sec = 0;          // Number of processses completed during one second
        int num_sec = 0;                    // Number of seconds passed during the experiment
        int start_time = uptime();          // Record start time of the round
        int d_time_new;
        int d_time_old = start_time;        // Number of ticks before one second 

        printf("EXECS CPU: %d / EXECS IO: %d\n", execs_cpu, execs_io);
        while (execs_cpu > 0 || execs_io > 0) {

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

            // --- Adjusting throughput values ---
            d_time_new = uptime();
            if ((d_time_new - d_time_old) > 100) {
                printf("passed one second with d_time_new = %d and dtime_old = %d\n", d_time_new, d_time_old);
                // one second passed by
                d_time_old = d_time_new;
                num_sec++;
                if (process_count_sec > max_throughput) {
                    max_throughput = process_count_sec;
                }
                if (process_count_sec < min_throughput) {
                    min_throughput = process_count_sec;
                }
                process_count_sec = 0;
            }

            if (execs_io > 0) {
                // Executing one iteration of IO-bound
                int p = fork();
                int status;
                if (p == 0) {
                    printf("starting io\n");
                    io_bound(file_path);
                    exit(EXIT_SUCCESS);
                }
                wait(&status);
                execs_io--;
                process_count_sec++;
                printf("finished for io now %d\n", execs_io);
            }

            // --- Adjusting throughput values ---
            d_time_new = uptime();
            if ((d_time_new - d_time_old) > 100) {
                printf("passed one second with d_time_new = %d and dtime_old = %d\n", d_time_new, d_time_old);
                // one second passed by
                d_time_old = d_time_new;
                num_sec++;
                if (process_count_sec > max_throughput) {
                    max_throughput = process_count_sec;
                }
                if (process_count_sec < min_throughput) {
                    min_throughput = process_count_sec;
                }
                process_count_sec = 0;
            }
        }

        // --- Calculating throughput values of the finished round ---
        throughputs[i] = total_processes / num_sec;         // Throughput of the round
        sum_throughput += throughputs[i];                   // Adding the throughput of the round into the sum of throughput values of the experiment
        int avg_throughput = sum_throughput / (i + 1);      // Adjusting avg_throughput to consider this round

        int norm_throughput = 1 - ((avg_throughput - min_throughput) / (max_throughput - min_throughput));
        printf("throughput of round %d is = %d\n", i, norm_throughput);
    } 
    free(throughputs);

    return 0;
}