#include "write-random-string.h"
#include "permute-line.h"
#include "io-bound.h"
#include "../kernel/types.h"
#include "user.h"

void io_bound(char file_path[], int *efficiency, int *memory_time) {
    // --- Writing 100 random strings ---
    int t_write_first = 0;                  // number of write syscalls * 100 by number of seconds
    write_random_string(file_path, &t_write_first, memory_time);
    

    // --- Executing 50 permutations ---
    int t_read = 0;                         // number of read syscalls * 100 by number of seconds
    int t_write_second = 0;                 // number of write syscalls * 100 by number of seconds

    permute_line(file_path, &t_read, &t_write_second, memory_time);
    
    int t_write = (t_write_first + t_write_second) / 2;

    int t_del = 0;
    int old_time = uptime();
    if (unlink(file_path) != 0) {
        printf("Error when trying to delete file 'output.txt'\n");
    }
    t_del = (1 * 10000) / ((uptime() + 1) - old_time);        // number of deletes * 100 by number of seconds. Adjusted with +1 to guarantee non-zero division
    
    // ---- Calculating efficiency metric ---
    int denominator_efficiency = t_read + t_write + t_del;
    *efficiency += (1 * 1000000) / denominator_efficiency;      // efficiency multiplied by big constant so we are able to print 2 decimal places
    printf("memory_time inside io_bound = %d\n", *memory_time);

}