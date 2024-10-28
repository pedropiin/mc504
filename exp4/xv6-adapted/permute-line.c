#include "permute-line.h"
#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"


int permute_line(char file_path[]) {
    int fp = open(file_path, O_RDONLY);
    if (fp < 0 ) {
        printf(1, "Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    char lines[NUM_STRINGS][STRING_SIZE];
    int line_idx=0;

    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
        line_idx++;
    }

    // --- Getting random indices representing random strings ---
    int line1 = random() % NUM_STRINGS;
    int line2 = random() % NUM_STRINGS;

    // --- Swap lines in memory ---
    if (line1 != line2) {
        char temp[STRING_SIZE];
        strcpy(temp, lines[line1]);
        strcpy(lines[line1], lines[line2]);
        strcpy(lines[line2], temp);
    }
    
    // --- Close and reopen to reset the file pointer ---
    close(fp);  
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
        printf(1, "Failed to open file for writing in permutation routine.\n");
        return -1;
    }

    for (int i = 0; i < line_idx; i++) {
        write(fp, lines[i], STRING_SIZE);
    }

    close(fp);
    return 0;
}