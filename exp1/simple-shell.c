/*
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
TODO: document function
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

    command[num_elems_input] = NULL;    // adding NULL into the end of the list of arguments
    strcpy(command[0], command_path); // setting the whole path for the command in the list of args used in syscall execv()
    if (found) {
        execv(command_path, command);
    }
    else {
        printf("Error: The input command was not found. Exiting.\n");
    }
}


int main (int argc, char **argv) {

    simple_shell(argv);

    return 0;
}