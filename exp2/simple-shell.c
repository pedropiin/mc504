/*
EXP 2
André Santos Rocha - 235887 - Turma A
Pedro da Rosa Pinheiro - 231081 - Turma A
*/

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

#define _GNU_SOURCE
#define MAX_COMMAND_SIZE 1024
#define MAX_STRING_SIZE 128
#define FALSE 0
#define TRUE 1

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
token_count_input (int): number of strings in 'command', that is, 1 (representing
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
int search_dirs(char **command, int token_count_input, char **dirs_list, int num_dirs) {
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

    command[token_count_input] = NULL;  // adding NULL into the end of the list of arguments
    strcpy(command[0], command_path); // setting the whole path for the command in the list of args used in syscall execv()

    return found;
}

/*
Function that frees all elements of an array dinamically allocated 
array of strings, i.e., char **.
PARAMETERS:
arr (char**): array of strings that is going to be freed
size (int): number of allocated spaces in the array
RETURNS:
void
*/
void free_mem(char **arr, int size) {
    for (int i = 0; i < size; i++) {
        free(arr[i]);
    }
    free(arr);
}


/*
Function that handles the child background process in order to stop 
it from becoming a zombie process or interfering with the shell
prompt.
PARAMETERS:
signal (int): int who identifies which signal is using tha handler
RETURNS:
void
*/
void signal_handler(int signal) {
    int status;
    while ((waitpid(-1, &status, WNOHANG)) > 0);
    fflush(stdout);
}

void simple_shell(char **argv, int argc) {
    if (argc < 2) {
        printf("No directories passed as arguments.\n");
        exit(EXIT_FAILURE);
    }

    // --- Allocating memory for list of directories taken as arguments ---
    int size_dirs = strlen(argv[1]);
    char **dirs_list = (char**)calloc(MAX_STRING_SIZE, sizeof(char*));
    for (int i = 0; i < size_dirs; i++) {
        dirs_list[i] = (char*)calloc(MAX_STRING_SIZE, sizeof(char));
    }

    // --- Parsing through arguments and getting directories ---
    int num_dirs = parse_and_crop(argv[1], size_dirs, dirs_list, ':');

    while (TRUE) {
        // --- Printing shell prompt ---
        int status;
        fflush(stdout);
        printf("simple-shell$: ");
        fflush(stdout);

        signal(SIGCHLD, signal_handler);

        // --- Receiving command from input ---
        char *input = (char*)calloc(MAX_COMMAND_SIZE, sizeof(char));
        fgets(input, MAX_COMMAND_SIZE, stdin);
        int input_size = strlen(input); // Removing '\n' from the end of the last argument
        input[input_size - 1] = '\0';

        if (strcmp(input, "exit") == 0) { 
            // user asked to leave
            free(input);
            break;
        }

        if (strcmp(input, "") == 0) { 
            // empty input
            free(input);
            continue;
        }

        // --- Allocating memory for command and its list of arguments ---
        int size_input = strlen(input);
        char **command = (char**)calloc(MAX_STRING_SIZE, sizeof(char*));
        for (int i = 0; i < size_input; i++) {
            command[i] = (char*)calloc(MAX_STRING_SIZE, sizeof(char));
        }

        // --- Parsing through input and its arguments ---
        int token_count_input =  parse_and_crop(input, size_input, command, ' '); 

        // --- Checking if command needs to run in the background ---
        int bg = 0;
        if (strcmp(command[token_count_input - 1], "&") == 0) { 
            // last token == '&', meaning that the command should run in the background
            bg = 1;
            command[token_count_input - 1] = NULL;
            command[token_count_input] = '\0';
        }

        // --- Searching directories for the command ---
        int found = search_dirs(command, token_count_input, dirs_list, num_dirs);
        if (!found) {
            printf("ERROR: The input command was not found.\n");
        } else {
            pid_t p = fork();
            if (p == 0) {
                // dealing with child process 
                if (execv(command[0], command) == -1) {
                    printf("ERROR: Could not run the command.\n");
                }
                exit(EXIT_SUCCESS);
            } else if (p < 0) {
                // error while creating child process
                printf("ERROR: Could not create child process\n");
            } else {
                // dealing with parent process 
                if (!bg) {
                   waitpid(-1, &status, 0);
                }
            }
        }
        free(input);
        free_mem(command, token_count_input);
    }
    free_mem(dirs_list, size_dirs);
}


int main (int argc, char **argv) {
    simple_shell(argv, argc);

    return 0;
}
