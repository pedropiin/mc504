// C program that generates random strings, writes
// them to a new file, permutates part of them randomly
// and then deletes the file. All of this according to 
// EXP 4's boundaries

#include "write-random-string.h"
#include "../kernel/types.h"
#include "../kernel/fcntl.h"
#include "../kernel/stat.h"
#include "user.h"

void generate_random_string(char* s, const char char_set[], const size_t size_char_set) {
    for (int i = 0; i < (STRING_SIZE - 2); i++) {
        int idx_new_char = random() % size_char_set;
        s[i] = char_set[idx_new_char];
    }
    s[STRING_SIZE - 2] = '\n';
    s[STRING_SIZE - 1] = '\0';
}

int write_random_string(char file_path[], int *t_write, int *memory_time) {
    // --- Defining set of possible characters for the string --- 
    const char char_set[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?'!@#$&*()-+{}[].;,<>:|";
    const size_t size_char_set = sizeof(char_set) - 1;

    int start_time = uptime();
    char* s = malloc(STRING_SIZE * sizeof(char));
    int finish_time = uptime();
    *memory_time += finish_time - start_time + 1;

    // --- Generating and writing 100 random strings ---
    int fp = open(file_path, O_WRONLY | O_CREATE);  

    int old_time;
    int count_ticks = 0;                            // counts the number of ticks that took to complete the whole 100 write() syscalls
    for (int i = 0; i < NUM_STRINGS; i++) {
        generate_random_string(s, char_set, size_char_set);
        old_time = uptime();
        write(fp, s, STRING_SIZE);
        count_ticks += (uptime() - old_time);
    }

    *t_write = (NUM_STRINGS * 10000) / count_ticks;    // number of write syscalls * 100 by number of seconds

    close(fp);
    start_time = uptime();
    free(s);
    finish_time = uptime();
    *memory_time += finish_time - start_time + 1;

    return 0;
}
