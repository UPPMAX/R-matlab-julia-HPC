#!/bin/bash
#SBATCH -A hpc2n2025-062 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 8

export OMPI_MCA_mpi_warn_on_fork=0

ml purge > /dev/null 2>&1
ml GCC/11.3.0  OpenMPI/4.1.4
ml R/4.2.1

mpirun -np 1 R CMD BATCH --no-save --no-restore Rmpi.R output.out
