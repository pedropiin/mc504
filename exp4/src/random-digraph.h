// C program that generates a random directed graph
// according to EXP 4's boundaries

#ifndef RANDOM_DIGRAPH_H
#define RANDOM_DIGRAPH_H

#define MIN_VERT 100
#define MAX_VERT 200
#define MIN_EDGE 50
#define MAX_EDGE 400

/* 
Function that generates a random digraph with
num_vertices in [100, 199] and num_edges in [50, 399].
The 2d array is initialized with 200x200 positions, but 
the remaining positions are all set to -1 to avoid incorrect
memory access.
*/
void gen_random_digraph(int graph[][MAX_VERT], int *num_vertices, int *num_edges);

#endif 