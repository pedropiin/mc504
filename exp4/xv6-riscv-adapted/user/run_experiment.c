#include "cpu-bound.h"
#include "io-bound.h"
#include "../kernel/types.h"
#include "user.h"

#define NUM_ROUNDS 30
#define EXIT_SUCCESS 0

int main(int argc, char *argv[]) {
    int execs_cpu;
    int execs_io;
    char file_path[] = "./output.txt";
    // --- Executing 30 rounds of the experiment ---
    int p = fork();
    char command[1][20] = {"run_experiment"};
    if (p == 0) {
        // dealing with child process 
        if (exec(command[0], command) == -1) {
            printf("ERROR: Could not run the command.\n");
        }
        exit(EXIT_SUCCESS);
    } else if (p < 0) {
        // error while creating child process
        printf("ERROR: Could not create child process\n");
    } 
    // else {
    //     // dealing with parent process 
    //     if (1) {
    //         waitpid(-1, &status, 0);
    //     }
    // }
    for (int i = 0; i < NUM_ROUNDS; i++) {
        // --- Defining number of executions for each round ---
        execs_cpu = (random() % 9) + 6; // must be in [6, 14]
        execs_io = 20 - execs_cpu; // must be 20 - X

        for (int j = 0; j < execs_cpu; j++) {
            cpu_bound();
        }

        for (int j = 0; j < execs_io; j++) {
            io_bound(file_path);
        }
    }

    return 0;
}