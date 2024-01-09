#!/bin/bash
#SBATCH --time=5:00
#SBATCH --partition=cpar
#SBATCH --constraint=k20


module load gcc/7.2.0
module load cuda/11.3.1

# Nome do arquivo do programa CUDA
FILE="src/MD.cu"
ORIGINAL_VALUE="const int N=5000;"

VALORES_N=(1000 5000 10000 15000 20000 25000 30000 35000 40000 45000 50000)

for N in "${VALORES_N[@]}"
do
    sed -i "s/$ORIGINAL_VALUE.*/const int N=$N;/" $FILE

    make

    sbatch run.sh

done

# Restaura o valor original de N no arquivo
sed -i "s/const int N=$N.*/$ORIGINAL_VALUE/" $FILE
