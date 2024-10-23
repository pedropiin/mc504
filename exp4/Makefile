CC = gcc

run_experiment: run_experiment.o cpu-bound.o io-bound.o random-digraph.o dijkstra.o write-random-string.o permute-line.o
	$(CC) run_experiment.o cpu-bound.o io-bound.o random-digraph.o dijkstra.o write-random-string.o permute-line.o -o experiment

run_experiment.o: src/run_experiment.c 
	$(CC) -c src/run_experiment.c 

cpu-bound.o: src/cpu-bound.c 
	$(CC) -c src/cpu-bound.c 

io-bound.o: src/io-bound.c 
	$(CC) -c src/io-bound.c 

random-digraph.o: src/random-digraph.c
	$(CC) -c src/random-digraph.c

dijkstra.o: src/dijkstra.c
	$(CC) -c src/dijkstra.c

write-random-string.o: src/write-random-string.c
	$(CC) -c src/write-random-string.c

permute-line.o: src/permute-line.c
	$(CC) -c src/permute-line.c

clean:
	rm run_experiment.o cpu-bound.o io-bound.o random-digraph.o dijkstra.o write-random-string.o permute-line.o
	clear