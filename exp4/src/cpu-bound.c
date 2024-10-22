/*
Routine that solves all of the 1000
minimum path problems in random graphs
*/

#include <stdio.h>
#include <unistd.h>
#include "random-digraph.h"
#include "dijkstra.h"

#define NUM_EXEC 1000

int main(int argc, char *argv[]) {
    // --- Executing the 1000 rounds of generating a random graph ---
    // --- and calculating the minimal distance between the edges ---
    for (int i = 0; i < NUM_EXEC; i++) {
        int graph[MAX_VERT][MAX_VERT];
        int num_vertices;
        int num_edges;

        gen_random_digraph(graph, &num_vertices, &num_edges);

        int dist[MAX_VERT];
        dijkstra(graph, num_vertices, num_edges, 0, dist);

        printf("--- NOW PRINTING THE DISTANCE ARRAY ---\n");
        for (int i = 0; i < num_vertices; i++) {
            if (dist[i] < INF) {
                printf("distance from src vertex to %d = %d\n", (i + 1), dist[i]);
            } else {
                dist[i] = -1;
                printf("no path from src vertex to %d\n", (i + 1));
            }
        }
        sleep(2);
    }
    return 0;
}