CC = gcc
SRC = src/
CFLAGS = -Ofast -mavx

.DEFAULT_GOAL = all

all: MDseq.exe MDpar.exe

MDseq.exe: $(SRC)/MDseq.cpp
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe	

MDpar.exe: $(SRC)/MDpar.cpp
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -ftree-vectorize -o MDpar.exe


clean:
	rm ./MD*.exe

runseq:
	./MDseq.exe < inputdata.txt

runpar:
	./MDpar.exe < inputdata.txt


