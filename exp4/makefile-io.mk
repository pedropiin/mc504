CC = gcc

io-bound: io-bound.o write-random-string.o permute-line.o
	$(CC) io-bound.o write-random-string.o permute-line.o -o io-bound

permute-line.o: src/permute-line.c
	$(CC) -c src/permute-line.c

write-random-string.o: src/write-random-string.c
	$(CC) -c src/write-random-string.c

io-bound.o: src/io-bound.c
	$(CC) -c src/io-bound.c
