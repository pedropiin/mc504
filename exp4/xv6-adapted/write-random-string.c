// C program that generates random strings, writes
// them to a new file, permutates part of them randomly
// and then deletes the file. All of this according to 
// EXP 4's boundaries

#include "write-random-string.h"
#include "user.h"
#include "types.h"
#include "fcntl.h"
#include "stat.h"

// Emulate O_APPEND functionality
int open_append(const char *path) {
    int fd = open(path, O_WRONLY | O_CREATE);
    if (fd >= 0) {
        // Move the file pointer to the end of the file
        lseek(fd, 0, 2); // 2 is SEEK_END
    }
    return fd;
}


void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set) {
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
    

    int fp = open_append(file_path);
    if (fp < 0) {
        printf(1,"Failed when trying to open file in the 'writing-random-string' routine. Aborting.\n");
        return -1;
    }
    char s[STRING_SIZE];
    generate_random_string(s, char_set, size_char_set);
    write(fp, s, strlen(s));
    close(fp);

    return 0;
}
