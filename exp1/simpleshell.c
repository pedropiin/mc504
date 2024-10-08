/*
EXP 1
André Santos Rocha - 235887 - Turma A
Pedro da Rosa Pinheiro - 231081 - Turma A
*/

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

#define MAX_COMMAND_SIZE 1000
#define MAX_STRING_SIZE 100

/*
Function that receives a string as input and divides into smaller substrings
based on a certain character interpreted as the divisor. 
Example: 'og_string' = "testA:testB1:testB2!" with 'crop_char' = ':' will be
divided into three strings: "testA", "testB1", "testB2!"
PARAMETERS:
og_string (char*): string that will be read, parsed and divided according to 
                a certain character also received by input
size_og_string (int): size, that is, number of characters, in the og_string
arr_strings (char**): char double pointer taken as an array of strings that
                will hold all the cropped strings taken from 'og_string'.
crop_char (char): character to be seen as a divisor of different strings.  
OUTPUT:
num_elems (int): ammount of different elements, that is, strings, taken through
                dividing the 'og_string' into different smaller strings.
*/
int parse_and_crop(char *og_string, int size_og_string, char **arr_strings, char crop_char) {
    int last_crop_char = 0;
    int num_elems = 0;
    for (int i = 0; i < size_og_string; i++) {
        if (og_string[i] == crop_char) {
            strncpy(arr_strings[num_elems], og_string + last_crop_char, (i - last_crop_char));
            num_elems++;
            last_crop_char = i + 1;
        }
    }
    strncpy(arr_strings[num_elems], og_string + last_crop_char, (size_og_string - last_crop_char));
    num_elems++;

    return num_elems;
}

/*
Function that goes through all of the directories passed as arguments when 
running the simple-shell and checks if the file related to the command 
taken as input exists in each one. To check if the file exists, the function
tries to open it with fopen(), and if the function returns anything but NULL 
(in this case, a pointer to the file), the file exists.
PARAMETERS:
command (char**): char double pointer taken as an array of strings that holds 
                the command and all of its arguments as different strings
num_elems_input (int): number of strings in 'command', that is, 1 (representing
                the command itself) plus the amount of arguments passed by input.
dirs_list (char**): char double pointer taken as an array of strings that holds
                the list of directories that the command needs to be searched 
                for in.
num_dirs (int): number of strings in 'dirs_list', that is, the number of directories
                that need to be searched.
OUTPUT:
found (int): int variable interpreted as boolean representing if the command was 
            found in any of the passed directories.
*/
int search_dirs(char **command, int num_elems_input, char **dirs_list, int num_dirs) {
    // --- Concatenating the command ---
    char first_command[MAX_STRING_SIZE];
    strcpy(first_command, "/");
    strcat(first_command, command[0]);

    // --- Checking which of the directories contains the desired command ---
    char command_path[MAX_STRING_SIZE];
    int found = 0;
    for (int i = 0; i < num_dirs; i++) {
        strcpy(command_path, dirs_list[i]);
        strcat(command_path, first_command);
        if (fopen(command_path, "r") != NULL) {
            found = 1;
            break;
        }
    }

    command[num_elems_input] = NULL;  // adding NULL into the end of the list of arguments
    strcpy(command[0], command_path); // setting the whole path for the command in the list of args used in syscall execv()

    return found;
}

void simple_shell(char **argv) {
    // --- Allocating memory for list of directories taken as arguments ---
    int size_dirs = strlen(argv[1]);
    char **dirs_list = (char**)malloc(sizeof(char*) * MAX_STRING_SIZE);
    for (int i = 0; i < size_dirs; i++) {
        dirs_list[i] = (char*)malloc(MAX_STRING_SIZE);
    }

    // --- Parsing through arguments and getting directories ---
    int num_dirs = parse_and_crop(argv[1], size_dirs, dirs_list, ':');

    // --- Printing shell prompt ---
    printf("simple-shell$: ");

    // --- Receiving command from input ---
    char *input = (char*)malloc(MAX_COMMAND_SIZE);
    fgets(input, MAX_COMMAND_SIZE, stdin);

    // --- Allocating memory for command and its list of arguments ---
    int size_input = strlen(input);
    char **command = (char**)malloc(sizeof(char*) * MAX_STRING_SIZE);
    for (int i = 0; i < size_input; i++) {
        command[i] = (char*)malloc(MAX_STRING_SIZE);
    }

    // --- Parsing through input and its arguments ---
    int num_elems_input =  parse_and_crop(input, size_input, command, ' '); 
    int last_command_size = strlen(command[num_elems_input - 1]);   // Removing '\n' from the end of the last argument
    command[num_elems_input - 1][last_command_size - 1] = '\0';

    // --- Searching directories for the command ---
    int found = search_dirs(command, num_elems_input, dirs_list, num_dirs);
    if (found) {
        execv(command[0], command);
    } else {
        printf("Error: The input command was not found. Exiting.\n");
    }
}


int main (int argc, char **argv) {

    simple_shell(argv);

    return 0;
}