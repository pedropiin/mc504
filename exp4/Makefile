cpu-bound: cpu-bound.o random-digraph.o dijkstra.o
	gcc cpu-bound.o random-digraph.o dijkstra.o -o cpu-bound

random-digraph.o: random-digraph.c
	gcc -c random-digraph.c

dijkstra.o: dijkstra.c
	gcc -c dijkstra.c

cpu-bound.o: cpu-bound.c
	gcc -c cpu-bound.c

clean:
	rm random-digraph.o dijkstra.o cpu-bound.o