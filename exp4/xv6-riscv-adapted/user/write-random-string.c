// C program that generates random strings, writes
// them to a new file, permutates part of them randomly
// and then deletes the file. All of this according to 
// EXP 4's boundaries

#include "write-random-string.h"
#include "../kernel/types.h"
#include "../kernel/fcntl.h"
#include "../kernel/stat.h"
#include "user.h"

int add_line(char file_path[], char *new_line) {
    int fp = open(file_path, O_RDONLY | O_CREATE);  
    if (fp < 0) {
        printf("Failed to open file for reading.\n");
        return -1;
    }

    // char lines[NUM_STRINGS][STRING_SIZE];
    char** lines = malloc(NUM_STRINGS * sizeof(char*));
    for (int i = 0; i < NUM_STRINGS; i++) {
        lines[i] = malloc(STRING_SIZE * sizeof(char));
    }
    
    int line_idx = 0;
    // --- Read all lines from the file ---
    while (read(fp, lines[line_idx], STRING_SIZE) > 0 && line_idx < NUM_STRINGS) {
        line_idx++;
        printf("line_idx: %d\n", line_idx);
    }
    close(fp); 

    // --- Add the new line in memory ---
    strcpy(lines[line_idx], new_line);
    line_idx++;

    // --- Overwrite file with new lines ---
    fp = open(file_path, O_WRONLY);  
    if (fp < 0) {
        printf("Failed to open file for writing.\n");
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


void generate_random_string(char* s, const char char_set[], const size_t size_char_set) {
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
        s[i] = char_set[idx_new_char];
    }
    s[STRING_SIZE - 2] = '\n';
    s[STRING_SIZE - 1] = '\0';
}

int write_random_string(char file_path[]) {
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
    const size_t size_char_set = sizeof(char_set) - 1;
    char* s = malloc(STRING_SIZE * sizeof(char));
    
    generate_random_string(s, char_set, size_char_set);
    add_line(file_path, s);
    
    free(s);

    return 0;
}
