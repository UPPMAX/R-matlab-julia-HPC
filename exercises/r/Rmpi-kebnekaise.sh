#!/bin/bash
#SBATCH -A hpc2n2025-151 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 8

export OMPI_MCA_mpi_warn_on_fork=0

ml purge > /dev/null 2>&1
ml GCC/13.2.0 R/4.4.1
ml OpenMPI/4.1.6 R-bundle-CRAN/2024.06

mpirun -np 1 Rscript Rmpi.R 

