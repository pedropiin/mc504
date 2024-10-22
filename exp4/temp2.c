#include "random-digraph.h"

#include <stdio.h>

int main(int argc, char *argv[]) {

    int graph[MAX_VERT][MAX_VERT];
    int num_vertices, num_edges;

    gen_random_digraph(graph, &num_vertices, &num_edges);

    for (int i = 0; i < num_vertices; i++) {
        for (int j = 0; j < num_edges; j++) {
            printf("%d ", graph[i][j]);
        }
        printf("\n");
    }

    return 0;
}