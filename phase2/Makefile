CC = gcc
SRC = src/
CFLAGS = -Ofast -mavx

.DEFAULT_GOAL = all

all: MDseq.exe MDpar.exe

MDseq.exe: $(SRC)/MDseq.cpp
	module load gcc/11.2.0;
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe	

MDpar.exe: $(SRC)/MDpar.cpp
	module load gcc/11.2.0;
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -ftree-vectorize -o MDpar.exe


clean:
	rm ./MD*.exe

runseq:
	./MDseq.exe < inputdata.txt

runpar:
	./MDpar.exe < inputdata.txt


