cpu-bound: cpu-bound.o random-digraph.o dijkstra.o
	gcc cpu-bound.o random-digraph.o dijkstra.o -o cpu-bound

random-digraph.o: src/random-digraph.c
	gcc -c src/random-digraph.c

dijkstra.o: src/dijkstra.c
	gcc -c src/dijkstra.c

cpu-bound.o: src/cpu-bound.c
	gcc -c src/cpu-bound.c

clean:
	rm random-digraph.o dijkstra.o cpu-bound.o