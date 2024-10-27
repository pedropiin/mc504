#include "permute-line.h"

#include <stdio.h>
#include <stdlib.h>

int permute_line(char file_path[]) {
    FILE *fp;
    fp = fopen(file_path, "r+");
    if (fp == NULL) {
        printf("Failed when trying to open file in the permutation routine. Aborting\n");
        return -1;
    }

    fpos_t fpos1, fpos2;
    char buff1[STRING_SIZE];
    char buff2[STRING_SIZE];

    // --- Getting random indices representing random strings ---
    int line1 = rand() % NUM_STRINGS;
    int line2 = rand() % NUM_STRINGS;

    // --- Making sure that line1 points to the the line that appears first ---
    if (line1 > line2) {
        int tmp = line2;
        line2 = line1;
        line1 = tmp;
    }

    // --- Skipping to the first line ---
    char *ctmp;
    for (int i = 0; i < (line1 - 1); i++) {
        ctmp = fgets(buff1, STRING_SIZE, fp);
        if (ctmp == NULL) {
            printf("Unable to read line %d from file.\n", i);
        } 
    }

    // --- Getting the first line ---
    fgetpos(fp, &fpos1);
    ctmp = fgets(buff1, STRING_SIZE, fp);

    for (int i = 0; i < (line2 - line1 - 1); i++) {
        ctmp = fgets(buff2, STRING_SIZE, fp);
        if (ctmp == NULL) {
            printf("Unable to read line %d from file.\n", i);
        }
    }

    // --- Getting the second line --
    fgetpos(fp, &fpos2);
    ctmp = fgets(buff2, STRING_SIZE, fp);
    
    // --- Changing lines ---
    fsetpos(fp, &fpos1);
    fputs(buff2, fp);
    fsetpos(fp, &fpos2);
    fputs(buff1, fp);

    fclose(fp);

    return 0;
}