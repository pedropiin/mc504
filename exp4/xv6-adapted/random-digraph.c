// C program that generates a random directed graph
// according to EXP 4's boundaries

#include "random-digraph.h"
#include "types.h"
#include "user.h"

// #include <stdlib.h>

void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges) {
    // --- Initializing graph parameters ---
    *num_vertices = random() % MAX_VERT;
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }

    *num_edges = random() % MAX_EDGE;
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
        for (int j = 0; j < *num_vertices; j++) {
            graph[i][j] = 0;
        }
    }

    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = *num_vertices; i < MAX_VERT; i++) {
        for (int j = *num_vertices; i < MAX_VERT; i++) {
            graph[i][j] = -1;
        }
    }

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    for (int i = 0; i < *num_edges; i++) {
        new_edge_u = random() % *num_vertices;
        new_edge_v = random() % *num_vertices;
        graph[new_edge_u][new_edge_v] = 1;
    }
}
