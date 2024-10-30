#include "write-random-string.h"
#include "permute-line.h"
#include "io-bound.h"
#include "../kernel/types.h"
#include "user.h"


void io_bound(char file_path[]) {
    // --- Writing 100 random strings ---
    for (int i = 0; i < NUM_STRINGS; i++) {
        write_random_string(file_path);
    }

    // --- Executing line permutations ---
    for (int i = 0; i < NUM_PERMUT; i++) {
        permute_line(file_path);
    }

    if (unlink(file_path) != 0) {
        printf("Error when trying to delete file 'output.txt'\n");
    }
}