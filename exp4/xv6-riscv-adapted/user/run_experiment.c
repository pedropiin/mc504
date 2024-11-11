#include "cpu-bound.h"
#include "io-bound.h"
#include "metrics.h"
#include "../kernel/types.h"
#include "user.h"

#define EXIT_SUCCESS 0

// --- Variables used for throughput calculation ---


int main(int argc, char *argv[]) {
    int execs_cpu;
    int execs_io;
    int * throughputs = malloc(NUM_ROUNDS * sizeof(int));

    // printf("USERTRAP");
    // char* file_path = malloc(20*sizeof(char));
    // strncpy(file_path, "output.txt", 10);
    // file_path[11] = '\0';
    // printf("USEROUT");

    char file_path[] = "output.txt";

    // --- Executing 30 rounds of the experiment ---

    for (int i = 0; i < NUM_ROUNDS; i++) {
        printf("ROUND: %d\n", i);
        // DO NOT ERASE THE COMENTS BELOW, i commented so i could use smaller numbers and get faster executions
        // also changed num_rounds for 3 instead of 30 
        execs_cpu = (random() % 9) + 6;
        execs_io = 20 - execs_cpu;
        // execs_cpu = (random() % 3) + 1;
        // execs_io = 5 - execs_cpu;
        int total_processes = execs_cpu + execs_io;

        int start_time = uptime(); // Record start time of the round

        while (execs_cpu > 0 || execs_io > 0) {
            if (execs_cpu > 0) {
                int p = fork();
                int status;
                if (p == 0) {
                    printf("starting cpu\n");
                    cpu_bound();
                    exit(EXIT_SUCCESS);
                }
                wait(&status);
                execs_cpu--;
                printf("finished for cpu\n");
            }
            if (execs_io > 0) {
                int p = fork();
                int status;
                if (p == 0) {
                    printf("starting io\n");
                    io_bound(file_path);
                    exit(EXIT_SUCCESS);
                }
                wait(&status);
                execs_io--;
                printf("finished for io\n");
            }
        }
        /// --- START METRICS CALCULATION ---
        int end_time = uptime(); // Record end time of the round
        int duration = start_time - end_time;

        /// --- Throughput calculation ---        
        throughputs[i] = total_processes / duration; // Processes per second
        float norm_throughput = get_normalized_throughput(duration, throughputs, i);
        printf("VAZAO: %f", norm_throughput);

    } 
    free(throughputs);

    return 0;
}