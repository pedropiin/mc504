#include "cpu-bound.h"
#include "io-bound.h"

#include <stdio.h>
#include <stdlib.h>

#define NUM_ROUNDS 30

int main(int argc, char *argv[]) {
    int execs_cpu;
    int execs_io;
    char file_path[] = "./output.txt";
    // --- Executing 30 rounds of the experiment ---
    for (int i = 0; i < NUM_ROUNDS; i++) {
        // --- Defining number of executions for each round ---
        execs_cpu = (rand() % 9) + 6; // must be in [6, 14]
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
