#include "cpu-bound.h"
#include "io-bound.h"
#include "../kernel/types.h"
#include "user.h"

#define NUM_ROUNDS 30
#define EXIT_SUCCESS 0

int main(int argc, char *argv[]) {
    int execs_cpu;
    int execs_io;

    // printf("USERTRAP");
    // char* file_path = malloc(20*sizeof(char));
    // strncpy(file_path, "output.txt", 10);
    // file_path[11] = '\0';
    // printf("USEROUT");

    char file_path[] = "output.txt";

    // --- Executing 30 rounds of the experiment ---
  
    for (int i = 0; i < NUM_ROUNDS; i++) {
        execs_cpu = (random() % 9) + 6;
        printf("execs_cpu: %d\n", execs_cpu);
        execs_io = 20 - execs_cpu;

       
        for (int j = 0; j < execs_cpu; j++) {
            int p = fork();
            int status;
            if (p == 0) {
                cpu_bound();
                exit(EXIT_SUCCESS);
            }
            wait(&status);
            printf("CPU BOUND FINISHED\n");
        }
       
        printf("execs_io: %d\n", execs_cpu);
        for (int j = 0; j < execs_io; j++) {
            int p = fork();
            int status;
            printf("p: %d\n", p);
            if (p == 0) {
                io_bound(file_path);
                exit(EXIT_SUCCESS);
            }
            wait(&status);
            printf("IO BOUND FINISHED\n");
        }
    } 
    // free(file_path);

    return 0;
}