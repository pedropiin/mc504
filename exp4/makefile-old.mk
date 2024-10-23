cpu:
	make -f makefile-cpu.mk

io:
	make -f makefile-io.mk

clean-cpu:
	rm cpu-bound.o random-digraph.o dijkstra.o

clean-io:
	rm io-bound.o write-random-string.o permute-line.o
