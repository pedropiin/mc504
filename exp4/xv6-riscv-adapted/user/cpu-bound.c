/*
Routine that solves all of the 1000
minimum path problems in random graphs
*/

#include "random-digraph.h"
#include "dijkstra.h"
#include "cpu-bound.h"
#include "../kernel/types.h"
#include "user.h"

// #include <stdio.h>
// #include <unistd.h>

void cpu_bound(int** graph) {
    // --- Executing the 1000 rounds of generating a random graph ---
    // --- and calculating the minimal distance between the edges ---
    for (int i = 0; i < NUM_GRAPHS; i++) {
        
        int num_vertices;
        int num_edges;
      
        gen_random_digraph(graph, &num_vertices, &num_edges);
      
        int* dist = malloc(MAX_VERT * sizeof(int));
        dijkstra(graph, num_vertices, num_edges, 0, dist);
        free(dist);
    }
    printf("CPU BOUND FINISHED\n");
}