#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define PAI(i) ((i-1) /2)
#define F_ESQ(i) (2*i+1) /* Filho esquerdo de i*/
#define F_DIR(i) (2*i+2) /* Filho direito de i*/
#define MAX_VERT 200
#define INF 2147483647


typedef struct no *p_no;


typedef struct {
    int prioridade;
    int vertice;
} Item;

typedef struct {
    Item *v;
    int *pos;
    int n,tamanho;
} FP;

typedef FP *p_fp;

p_fp criar_fprio(int tam) {
    /* cria uma fila de prioridade de tamanho tam
        Parameters:
            tam(int): inteiro que representa o tamanho da fila de prioridade 
        Returns:
            fprio(p_fp): ponteiro para a fila de prioridade criada
    */
    p_fp fprio = malloc(sizeof(FP));
    fprio->v = malloc(tam * sizeof(Item));
    fprio->n = 0;
    fprio->pos = malloc(tam *sizeof(int));
    fprio->tamanho = tam;
    return fprio;
}

void troca_item(Item *a, Item *b) {
    /* troca dois elementos de posicao num heap
        Parameters:
            a (*Item): ponteiro para um dos elementos a ser trocado
            b (*Item): ponteiro para o outro elemento a ser trocado
        Returns:
            void
    */
   Item temp = *a;
   *a = *b;
   *b = temp;

}

void troca_pos(int *a, int *b) {
    /* troca dois elementos de posicao num vetor
        Parameters:
            a (*Item): ponteiro para um dos elementos a ser trocado
            b (*Item): ponteiro para o outro elemento a ser trocado
        Returns:
            void
    */
    int temp = *a;
    *a = *b;
    *b = temp;
}

void subir_heap(p_fp fprio , int k) {
    /* sobe no heap a partir da posicao k, trocando elementos quando necessário
        Parameters: 
            fprio(p_fp): heap em que subiremos
            k(int): posicao a partir do qual subiremos
        Returns: void
    */
    
     if (k > 0 && fprio->v[PAI(k)].prioridade > fprio->v[k].prioridade) {   
        troca_item(&fprio->v[k], &fprio->v[PAI(k)]);
        troca_pos(&fprio->pos[fprio->v[k].vertice],&fprio->pos[fprio->v[PAI(k)].vertice]);
        subir_heap(fprio , PAI(k));
    }    
    
}

void inserir(p_fp fprio, int vertice, int prioridade) {
    /*Insere um novo elemento no heap
        Parameters:
            fprio(p_fp): heap no qual será inserido o novo elemento
            vertice(int): vertice do novo elemento
            prioridade(int): prioridade do novo elemento
        Returns: void
    
    */
    fprio->v[fprio->n].prioridade = prioridade;
    fprio->v[fprio->n].vertice = vertice;
    fprio->n++;
    subir_heap(fprio,fprio->n -1);
}


void descer_heap(p_fp fprio , int k) {
    /* desce no heap a partir da posicao k, trocando elementos quando necessário
        Parameters: 
            fprio(p_fp): heap em que desceremos
            k(int): posicao a partir do qual desceremos
        Returns: void
    */
    int menor_filho;
    if (F_ESQ(k) < fprio ->n) {
        menor_filho = F_ESQ(k);
        if (F_DIR(k) < fprio ->n &&
            fprio ->v[F_ESQ(k)].prioridade > fprio ->v[F_DIR(k)].prioridade)
            menor_filho = F_DIR(k);
        if (fprio ->v[k].prioridade > fprio->v[menor_filho].prioridade) {
            troca_item (&fprio->v[k], &fprio->v[menor_filho]);
            troca_pos(&fprio->pos[fprio->v[k].vertice],&fprio->pos[fprio->v[menor_filho].vertice]);
            descer_heap(fprio , menor_filho);
        }
    }
    
}

Item min_distance_vertex(p_fp fprio) {
    /* extrai o item com prioridade minima de um heap
    Parameters: 
        fprio(p_fp): ponteiro para o heap
    Returns:
        item(Item): item de prioridade minima
    */
    Item item = fprio->v[0];
    troca_item (&(fprio->v[0]), &(fprio->v[fprio->n - 1]));
    troca_pos(&fprio->pos[fprio->v[0].vertice],&fprio->pos[fprio->v[fprio->n - 1].vertice]);
    fprio->n--;
    fprio->tamanho--;
    descer_heap(fprio , 0);
    return item;
}

void mudar_prioridade(p_fp fprio, int vertice, int valor) {
    /*Muda a prioridade de um elemento no heap
        Parameters:
            fprio(p_fp): heap no qual o elemento está inserido
            vertice(int): vertice do elemento
            valor(int):  nova prioridade do elemento
        Returns: void
    
    */
    if (fprio->v[fprio->pos[vertice]].prioridade > valor) {
        fprio->v[fprio->pos[vertice]].prioridade = valor;
        subir_heap(fprio, fprio->pos[vertice]);
    } else {
        fprio->v[fprio->pos[vertice]].prioridade = valor;
        descer_heap(fprio, fprio->pos[vertice]);
    }
}

int vazia(p_fp fprio) {
    /* informa se um heap está vazio
        Parameters:
            fprio(p_fp): heap no qual o elemento está inserido
        Returns: 1, se estiver vazia e 0 caso contrário
    */
    if (fprio->tamanho == 0) {
        return 1;
    }
    else {
        return 0;
    }
}



int min_distance_vertex(int dist[MAX_VERT], int visited[MAX_VERT], int num_vertices) {
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



void dijkstra(int graph[MAX_VERT][MAX_VERT], int num_vertices, int num_edges, int src, int dist[MAX_VERT]) {
    // --- Initializing distance array and visited array
    Item item_aux;
    int v; 
    int *dist = malloc(num_vertices *sizeof(int));
    p_no t;
    p_fp fprio = criar_fprio(num_vertices);
  
    // int visited[num_vertices];
    for (int i = 0; i < num_vertices; i++) {
        dist[i] = INF;
        // visited[i] = 0;
        inserir(fprio, v, INT_MAX/2);
        fprio->pos[v] = v;
    }
    dist[src] = 0;
    mudar_prioridade(fprio, src, 0);


    while (!vazia(fprio)) {  
        item_aux = min_distance_vertex(fprio);
        int min_v = item_aux.vertice;

        if (item_aux.prioridade != INF) { //se o vertice minimo nao for infinito
            //percorrer vizinhos de v
            for (int i = 0; i < num_vertices; i++) {
                if (graph[min_v][i] != 0) {
                    if ((dist[i] > dist[min_v] + graph[min_v][i])) {
                        mudar_prioridade(fprio,min_v,dist[i]);
                        dist[i] = dist[min_v] + graph[min_v][i];
                    }
                }
            }
        }
    }
    free(fprio->v);
    free(fprio->pos);
    free(fprio);
    return dist;
}
    
    



