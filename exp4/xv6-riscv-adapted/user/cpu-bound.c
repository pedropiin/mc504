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



void cpu_bound() {
    // --- Executing the 1000 rounds of generating a random graph ---
    // --- and calculating the minimal distance between the edges ---
    int** graph = (int**)malloc(MAX_VERT * sizeof(int*));
    for (int i = 0; i < MAX_VERT; i++) {
        graph[i] = (int*)malloc(MAX_VERT * sizeof(int));
    }
    
    int* dist = malloc(MAX_VERT * sizeof(int));
    
    for (int i = 0; i < NUM_GRAPHS; i++) {
              
        int num_vertices;
        int num_edges;

        // printf("gen_random_digraph\n");
      
        gen_random_digraph(graph, &num_vertices, &num_edges);

        // printf("VERTICES: %d\n", num_vertices);
        // printf("EDGES: %d\n", num_edges);


        dijkstra(graph, num_vertices, num_edges, 0, dist);
        
    }
    
    for (int i = 0; i < MAX_VERT; i++) {
        free(graph[i]);
    }
    free(graph);
    free(dist);

}