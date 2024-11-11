#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#define MIN_VERT 100
#define MAX_VERT 200
#define MIN_EDGE 50
#define MAX_EDGE 400

#define MAX_VERT 200
#define MAX_EDGE 400
#define INF 2147483647
#define NUM_GRAPHS 1000

#define MOD 2147483647
int random_temp() {
    int seed = time(NULL)%MOD;
    seed = ((seed * 1664525)%MOD + 1013904223)%MOD;
    return seed;
}


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

void gen_random_digraph(int** graph, int *num_vertices, int *num_edges) {
    // --- Initializing graph parameters ---
    printf("entered gen_random_digraph\n");
    int arroz = random_temp();
    printf("random_temp returned %d\n", arroz);
    *num_vertices = arroz % MAX_VERT;
    // *num_vertices = random_temp() % MAX_VERT;
    printf("now im here num_vertices = %d\n", *num_vertices);
    if (*num_vertices < MIN_VERT) {
        *num_vertices += MIN_VERT;
    }
    printf("now num_vertices has value %d\n", *num_vertices);

    int feijao = random_temp();
    printf("random temp returned for the sceond time %d\n", feijao);
    *num_edges = random_temp() % MAX_EDGE;
    printf("now im here num_edges = %d\n", *num_edges);
    if (*num_edges < MIN_EDGE) {
        *num_edges += MIN_EDGE;
    }
    printf("now num_edges has value %d\n", *num_edges);

    // --- Initializing adjacency matrix graph valid values ---
    for (int i = 0; i < *num_vertices; i++) {
        for (int j = 0; j < *num_vertices; j++) {
            graph[i][j] = 0;
        }
    }
    printf("initialized the valid vertices\n");
    // --- Initializing adjacency matrix graph invalid/unacessible values ---
    for (int i = 0; i < *num_vertices; i++) {
        // printf("going to initialize line %d\n", i);
        for (int j = *num_vertices; j < MAX_VERT; j++) {
            // printf("dealing with line %d and column %d\n", i, j);
            graph[i][j] = -1;
        }
    }
    printf("------dealth with the first part---------\n");
    for (int i = *num_vertices; i < MAX_VERT; i++) {
        // printf("açsldkf line %d\n", i);
        for (int j = 0; j < MAX_VERT; j++) {
            // printf("açsldkf line %d and column %d\n", i, j);
            graph[i][j] = -1;
        }
    }
    printf("initialized the invalid vertices\n");

    // --- Initializing random directed edges ---
    int new_edge_u, new_edge_v;
    printf("num_edges = %d and num_vertices = %d\n", *num_edges, *num_vertices);
    for (int i = 0; i < *num_edges; i++) {
        printf("going to create edge number %d\n", i);
        new_edge_u = random_temp() % *num_vertices;
        new_edge_v = random_temp() % *num_vertices;
        printf("new_edge_u = %d and new_edge_v = %d\n", new_edge_u, new_edge_v);
        graph[new_edge_u][new_edge_v] = 1;
    }
    printf("initialized random edges\n");
}

void cpu_bound() {
    // --- Executing the 1000 rounds of generating a random graph ---
    // --- and calculating the minimal distance between the edges ---
    printf("just entered cpu_bound. going to allocate memory\n");
    int** graph = (int**)malloc(MAX_VERT * sizeof(int*));
    for (int i = 0; i < MAX_VERT; i++) {
        graph[i] = (int*)malloc(MAX_VERT * sizeof(int));
    }

    printf("allocated memory for the graph\n");
    int *dist = (int*)malloc(MAX_VERT * sizeof(int*));
    printf("allocated memory for the distance array. going to start the inner for loop\n");

    for (int i = 0; i < NUM_GRAPHS; i++) {
        
        int num_vertices;
        int num_edges;

        printf("before calling genrandomdigraph\n");
        gen_random_digraph(graph, &num_vertices, &num_edges);

        printf("after gendrandom digraph and before calling dijkstra\n");
        dijkstra(graph, num_vertices, num_edges, 0, dist);
        printf("after dijkstra\n");
    }
    printf("CPU BOUND FINISHED\n");
    for (int i = 0; i < MAX_VERT; i++) {
        free(graph[i]);
    }
    free(graph);
    free(dist);
}

int main() {
    for (int _ = 0; _ < 30; _++) {
        for (int i = 0; i < 20; i++) {
            printf("starting cpu_bound %d of round %d\n", i, _);
            cpu_bound();
        }
    }

}