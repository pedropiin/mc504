#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX_SIZE 10

void gen_params(int arr[][MAX_SIZE], int *num_rows, int *num_cols) {
    srandom(time(NULL));
    *num_rows = random() % MAX_SIZE;
    *num_cols = random() % MAX_SIZE;

    printf("The number of num_rows is: %d\n", *num_rows);
    printf("The number of num_cols is: %d\n", *num_cols);

    for (int i = 0; i < *num_rows; i++) {
        for (int j = 0; j < *num_cols; j++) {
            arr[i][j] = i * j;
        }
    }
}

int main(int argc, char *argv[]) {
    int arr[MAX_SIZE][MAX_SIZE];

    int num_rows, num_cols;
    gen_params(arr, &num_rows, &num_cols);

    printf("The number of num_rows outside the function is: %d\n", num_rows);
    printf("The number of num_cols outside the function is: %d\n", num_cols);

    printf("Now printing the matrix\n");
    for (int i = 0; i < num_rows; i++) {
        for (int j = 0; j < num_cols; j++) {
            printf("arr[%d][%d] is %d\n", i, j, arr[i][j]);
        }
    }

    printf("Trying to access arr[num_rows][0]:\n");
    printf("%d\n", arr[num_rows][0]);

    for (int i = 0; i < 10; i++) {
        printf("random number %d = %ld\n", i, random() % 200);
    }
}