#!/bin/bash
#SBATCH -A naiss2025-22-934 
# Asking for 15 min.
#SBATCH -t 00:15:00
#SBATCH -n 8
#SBATCH --exclusive 

ml purge > /dev/null 2>&1
ml R/4.2.2-hpc1-gcc-11.3.0-bare 

srun --mpi=pmix Rscript pbdMPI.R  

