CC = gcc
SRC = src/
CFLAGS = -Ofast -ftree-vectorize -mavx

.DEFAULT_GOAL = all

all: MDseq.exe MDpar.exe MDparInit.exe

MDseq.exe: $(SRC)/MDseq.cpp
	module load gcc/11.2.0;
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe	

MDpar.exe: $(SRC)/MDpar.cpp
	module load gcc/11.2.0;
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -lstdc++ -o MDpar.exe

	
MDparInit.exe: $(SRC)/MDparInit.cpp
	module load gcc/11.2.0;
	$(CC) $(CFLAGS) $(SRC)MDparInit.cpp -lm -fopenmp -lstdc++ -o MDparInit.exe

clean:
	rm ./MD*.exe

runseq:
	./MDseq.exe < inputdata.txt

srunseq:
	srun --partition=cpar perf stat -e L1-dcache-load-misses,instructions,cycles -M cpi -r 3 make runseq


runpar:
	./MDpar.exe < inputdata.txt

srunpar:
	srun --partition=cpar --cpus-per-task=4 perf stat -e L1-dcache-load-misses,instructions,cycles -M cpi -r 3 make runpar


runparinit:
	./MDparInit.exe < inputdata.txt

srunparinit:
	srun --partition=cpar --cpus-per-task=4 perf stat -e L1-dcache-load-misses,instructions,cycles -M cpi -r 3 make runparinit