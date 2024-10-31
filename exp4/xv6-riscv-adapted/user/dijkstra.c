/*
C program that implements Dijkstra's algorithm to calculate
the minimum distance in a directed graph
*/

#include "dijkstra.h"
#include "../kernel/types.h"
#include "user.h"


int min_distance_vertex(int* dist, int* visited, int num_vertices) {
    int min_dist = INF;
    int min_idx = 0;

    for (int i = 0; i < num_vertices; i++) {
        if (dist[i] < min_dist && !visited[i]) {
            min_dist = dist[i];
            min_idx = i;
        }
    }

    return min_idx;
}

void dijkstra(int** graph, int num_vertices, int num_edges, int src, int* dist) {
    // --- Initializing distance array and visited array
    int* visited = malloc(num_vertices*sizeof(int));
 
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        visited[i] = 0;
    }
    dist[src] = 0;

    // TODO: there is a chance that this for should iterate only to (num_vertices - 1).
    //       So there is a chance that this causes a segmentation fault.
    for (int _ = 0; _ < num_vertices; _++) {
        int min_v = min_distance_vertex(dist, visited, num_vertices);
        visited[min_v] = 1;

        if (dist[min_v] != INF) {
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
                    if (!visited[i] && (dist[i] > dist[min_v] + graph[min_v][i])) {
                        dist[i] = dist[min_v] + graph[min_v][i];
                    }
                }
            }
        }
    }
    free(visited);
}