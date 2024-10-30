// C program that generates random strings, writes
// them to a new file, permutates part of them randomly
// and then deletes the file. All of this according to 
// EXP 4's boundaries

#ifndef RANDOM_STRING_H
#define RANDOM_STRING_H

#include <stddef.h>

#define STRING_SIZE 102
#define NUM_STRINGS 100
#define NUM_PERMUT 50

void generate_random_string(char s[STRING_SIZE], const char char_set[], const size_t size_char_set);

int write_random_string(char file_path[]);

#endif 