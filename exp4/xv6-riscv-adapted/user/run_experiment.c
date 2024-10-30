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
    for (int i = 0; i < NUM_ROUNDS; i++) {
        execs_cpu = (random() % 9) + 6;
        execs_io = 20 - execs_cpu;

        for (int j = 0; j < execs_cpu; j++) {
            int p = fork();
            if (p == 0) {
                cpu_bound();
                exit(EXIT_SUCCESS);
            }
            wait(&p);
        }

        for (int j = 0; j < execs_io; j++) {
            int p = fork();
            if (p == 0) {
                io_bound(file_path);
                exit(EXIT_SUCCESS);
            }
            wait(&p);
        }
    } 

    return 0;
}