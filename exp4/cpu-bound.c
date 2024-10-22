/*
Routine that solves all of the 1000
minimum path problems in random graphs
*/

#include <stdio.h>
#include <unistd.h>
#include "random-digraph.h"
#include "dijkstra.h"

#define NUM_EXEC 1000

void print_2d_array(int graph[MAX_VERT][MAX_VERT], int *num_vertices) {
    printf("--- NOW PRINTING THE GRAPH ---\n");
    for (int i = 0; i < *num_vertices; i++) {
        for (int j = 0; j < *num_vertices; j++) {
            printf("%d ", graph[i][j]);
        }
        printf("\n");
    }
}

int main(int argc, char *argv[]) {
    // --- Executing the 1000 rounds of generating a random graph ---
    // --- and calculating the minimal distance between the edges ---
    for (int i = 0; i < NUM_EXEC; i++) {
        int graph[MAX_VERT][MAX_VERT];
        int num_vertices;
        int num_edges;

        gen_random_digraph(graph, &num_vertices, &num_edges);

        print_2d_array(graph, &num_vertices);

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);

        printf("--- NOW PRINTING THE DISTANCE ARRAY ---\n");
        for (int i = 0; i < num_vertices; i++) {
            printf("distance from src vertex to %d = %d\n", (i + 1), dist[i]);
        }
        sleep(2);
    }
    return 0;
}