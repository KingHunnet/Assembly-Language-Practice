CC = gcc
CCFLAGS = -Wall

all: formula

formula: formula.o nCr.o
	$(CC) $(CCFLAGS) formula.o nCr.o -o formula

formula.o: formula.c
	$(CC) $(CCFLAGS) -c formula.c nCr.s

nCr.o: nCr.s
	$(CC) $(CCFLAGS) -c nCr.s -o nCr.o

clean:
	rm -f formula mystery *.o
