#include "permute-line.h"
#include "../kernel/types.h"
#include "../kernel/fcntl.h"
#include "../kernel/stat.h"
#include "user.h"

#include <assert.h>

int permute_line(char file_path[]) {
    int fp = open(file_path, O_RDONLY);
    if (fp < 0 ) {
        printf("Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    // --- Allocating memory to hold all file lines ---
    char** lines = malloc(NUM_STRINGS * sizeof(char*));
    for (int i = 0; i < NUM_STRINGS; i++) {
        lines[i] = malloc(STRING_SIZE * sizeof(char));
    }

    int line_idx=0;
    // --- Reading all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE-1) > 0 && line_idx < NUM_STRINGS) {
        line_idx++;
    }
    close(fp);  

    int line1, line2;
    char *temp = malloc(STRING_SIZE);
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
    char *buffer = malloc(0);
    memset(buffer, 0, 0);  
    write(fp, buffer, 0);
    free(buffer);

    // --- Write the modified content back to the file ---
    if (fp < 0) {
        printf("Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
    }

    close(fp);

    for (int i = 0; i < NUM_STRINGS; i++) {
        free(lines[i]);
    }

    free(lines);
    return 0;
}