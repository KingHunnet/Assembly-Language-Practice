CC = gcc
CCFLAGS = -Wall

all: mystery

mystery: mystery.o
	$(CC) $(CCFLAGS) -o mystery mystery.o

mystery.o: mystery.c
	$(CC) $(CCFLAGS) -c mystery.c

clean:
	rm -f mystery *.o
