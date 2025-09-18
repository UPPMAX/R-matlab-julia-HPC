#!/bin/bash
#SBATCH -A hpc2n2025-062 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 8

export OMPI_MCA_mpi_warn_on_fork=0

ml purge > /dev/null 2>&1
ml GCC/11.2.0  OpenMPI/4.1.1
ml R/4.1.2

mpirun -np 1 Rscript Rmpi.R 
