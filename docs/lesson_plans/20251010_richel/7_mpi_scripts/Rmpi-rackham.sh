#!/bin/bash
#SBATCH -A staff
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 8

export OMPI_MCA_mpi_warn_on_fork=0
export OMPI_MCA_btl_openib_allow_ib=1

ml purge > /dev/null 2>&1
ml R/4.1.1 R_packages/4.1.1
ml openmpi/4.0.3

mpirun -np 1 R CMD BATCH --no-save --no-restore Rmpi.R output.out
