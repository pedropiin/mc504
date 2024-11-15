/*
C program that implements Dijkstra's algorithm to calculate
the minimum distance in a directed graph
*/

#ifndef DIJKSTRA_H
#define DIJKSTRA_H

#define MAX_VERT 200
#define MAX_EDGE 400
#define INF 2147483647

int min_distance_vertex(int* dist, int* visited, int num_vertices);

void dijkstra(int** graph, int num_vertices, int num_edges, int src, int* dist, int *memory_time);

#endif 
