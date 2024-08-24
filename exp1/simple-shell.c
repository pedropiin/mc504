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
int parse_args(char *argv, int size_argv, char **dirs_list) {
    int last_colon = 0; // position of the last ':' found in the arguments
    int num_dirs = 0; // number of directories passed as arguments
    for (int i = 0; i < size_argv; i++) {
        if (argv[i] == ':') {
            strncpy(dirs_list[num_dirs], argv + last_colon, (i - last_colon));
            num_dirs++;
            last_colon = i + 1;
        }
    }
    //copying last directory
    strncpy(dirs_list[num_dirs], argv + last_colon, (size_argv - last_colon));
    num_dirs++;

    return num_dirs;
}

/*
TODO: document function
*/
int parse_input(char *input, int size_input, char **command) {
    int last_space = 0;
    int num_arguments = 0;
    for (int i = 0; i < size_input; i++) {
        if (input[i] == ' ') {
            strncpy(command[num_arguments], input + last_space, (i - last_space));
            num_arguments++;
            last_space = i + 1;
        }
    }
    strncpy(command[num_arguments], input + last_space, (size_input - last_space));
    num_arguments++;

    return num_arguments;
}

int main (int argc, char **argv) {
    // parse directories as arguments
        // save position of last ':', initialized with 0
        // for until end of argv[1]
        // if ':' is found
            // new directory is string[old_comma:new:comma]
    // print simple-shell blablabla
    // getline or scanf
    // for through directories 
        // if directory with file is found (use fopen() without allocation)
            // save directory
            // found = 1
            // break    

    // if found
        // call execv("prog_name", "arg_list");
    // else 
        // print error

    // --- Allocating memory for list of directories taken as arguments ---
    int size_dirs = strlen(argv[1]);
    char **dirs_list = (char**)malloc(sizeof(char*) * MAX_STRING_SIZE);
    for (int i = 0; i < size_dirs; i++) {
        dirs_list[i] = (char*)malloc(MAX_STRING_SIZE);
    }

    // --- Parsing through arguments and getting directories ---
    int num_dirs = parse_args(argv[1], size_dirs, dirs_list);

    // --- Printing shell prompt ---
    printf("simple-shell$: ");

    // --- Receiving command from input ---
    char *input = (char*)malloc(MAX_COMMAND_SIZE);
    fgets(input, MAX_COMMAND_SIZE, stdin);

    // --- Allocating memory for command and its list of args ---
    int size_input = strlen(input);
    char **command = (char**)malloc(sizeof(char*) * MAX_STRING_SIZE);
    for (int i = 0; i < size_input; i++) {
        command[i] = (char*)malloc(MAX_STRING_SIZE);
    }

    // --- Parsing through input and its arguments ---
    // here note that the first element/first argument of the command is the command itself
    int num_args_input =  parse_input(input, size_input, command); 

    // ---Concatenating the command
    char first_command [100];
    strcpy(first_command,"/");
    strcat(first_command, command[0]);
    char path[100]; 
    // --- Checking which of the directories contains the desired command ---
    int found = 0;
    for (int i = 0; i < num_dirs; i++) {
        strcpy(path, dirs_list[i]);
        strcat(path,first_command);
        printf("path: %s", path);
        if (fopen(path, "r")) {
            found = 1;
            break;
        } 
    }
    printf("command[0]: %s\n", command[2]);
    if (found) {
        printf("exec\n");
        execv("/usr/bin/ls",command);
    }
    else {

    }



    return 0;
}