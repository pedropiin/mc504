CC = gcc

cpu-bound: cpu-bound.o random-digraph.o dijkstra.o
	$(CC) cpu-bound.o random-digraph.o dijkstra.o -o cpu-bound

random-digraph.o: src/random-digraph.c
	$(CC) -c src/random-digraph.c

dijkstra.o: src/dijkstra.c
	$(CC) -c src/dijkstra.c

cpu-bound.o: src/cpu-bound.c
	$(CC) -c src/cpu-bound.c
