// C program that generates random strings, writes
// them to a new file, permutates part of them randomly
// and then deletes the file. All of this according to 
// EXP 4's boundaries

#include "random-string.h"

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
    srandom(time(NULL));
    for (int i = 0; i < STRING_SIZE; i++) {
        int idx_new_char = random() % size_char_set;
        s[i] = char_set[idx_new_char];
    }
    s[STRING_SIZE - 1] = '\0';
}

void write_random_string(void) {
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$%&*()-+{}[].;,<>:|";
    const size_t size_char_set = sizeof(char_set) - 1;

    FILE *fptr;
    fptr = fopen("../output.txt", "a");
    if (fptr == NULL) {
        printf("Error when trying to open file 'output.txt'.\n");
    } else {
        for (int i = 0; i < NUM_STRINGS; i++) {
            char s[STRING_SIZE];
            generate_random_string(s, char_set, size_char_set);
            printf("writing string %s to file\n", s);
            fprintf(fptr, s);
        }
    }
    fclose(fptr);

    if (remove("./output.txt") == 0) {
        printf("File deleted successfully\n");
    } else {
        printf("Error when trying to delete file 'output.txt'\n");
    }
}
