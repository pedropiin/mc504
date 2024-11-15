#include "permute-line.h"
#include "../kernel/types.h"
#include "../kernel/fcntl.h"
#include "../kernel/stat.h"
#include "user.h"

#include <assert.h>

int permute_line(char file_path[], int *t_read, int *t_write_second, int *memory_time) {
    int fp = open(file_path, O_RDONLY);
    if (fp < 0 ) {
        printf("Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    int start_time = uptime();
    // --- Allocating memory to hold all file lines ---
    char** lines = malloc(NUM_STRINGS * sizeof(char*));
    for (int i = 0; i < NUM_STRINGS; i++) {
        lines[i] = malloc(STRING_SIZE * sizeof(char));
    }
    int finish_time = uptime();
    *memory_time += finish_time - start_time +1 ;

    int line_idx = 0;
    // --- Reading all lines from the file ---
    int old_time = uptime(), new_time;
    int count_ticks = 0;
    while (read(fp, lines[line_idx], STRING_SIZE-1) > 0 && line_idx < NUM_STRINGS) {
        new_time = uptime();
        count_ticks += (new_time - old_time);
        old_time = new_time;
        line_idx++;
    }
    close(fp);  

    *t_read = (NUM_STRINGS * 10000) / (count_ticks + 1);     // number of read syscalls * 100 by number of seconds. Adding one to count_ticks to assure non-zero division

    int line1, line2;
    
    start_time = uptime();
    char *temp = malloc(STRING_SIZE);
    finish_time = uptime();
    *memory_time += finish_time - start_time;

    for (int i = 0; i < NUM_PERMUT; i++) {
        // --- Getting random indices representing lines to be changed ---
        line1 = random() % NUM_STRINGS;
        line2 = random() % NUM_STRINGS;

        // --- Swapping lines in memory ---
        if (line1 != line2) {
            strcpy(temp, lines[line1]);
            strncpy(lines[line1], lines[line2], STRING_SIZE);
            strcpy(lines[line2], temp);
        }
    }

    // --- Reopen the file pointer ---
    fp = open(file_path, O_RDWR);

    // --- Fill buffer with zeroes to clear the file ---
    struct stat st;
    fstat(fp, &st);
    start_time = uptime();
    char *buffer = malloc(0);
    finish_time = uptime();
    *memory_time += finish_time - start_time;
    memset(buffer, 0, 0);  
    write(fp, buffer, 0);
    start_time = uptime();
    free(buffer);
    finish_time = uptime();
    *memory_time += finish_time - start_time;

    // --- Write the modified content back to the file ---
    if (fp < 0) {
        printf("Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    count_ticks = 0;
    for (int i = 0; i < line_idx; i++) {
        old_time = uptime();
        write(fp, lines[i], STRING_SIZE);
        count_ticks += (uptime() - old_time);
    }

    *t_write_second = (NUM_STRINGS * 10000) / count_ticks;       // number of write syscalls * 100 by number of seconds
    
    close(fp);

    start_time = uptime();
    for (int i = 0; i < NUM_STRINGS; i++) {
        free(lines[i]);
    }

    free(lines);
    finish_time = uptime();
    *memory_time += finish_time - start_time;
    return 0;
}