CC = gcc
SRC = src/
CFLAGS = -Ofast -mavx -ftree-vectorize

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	rm ./MD.exe

run: MD.exe
	./MD.exe < inputdata.txt
