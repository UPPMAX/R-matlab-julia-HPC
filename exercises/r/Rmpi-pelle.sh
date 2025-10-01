#!/bin/bash -l
#SBATCH -A uppmax2025-2-360
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 8

export OMPI_MCA_mpi_warn_on_fork=0
export OMPI_MCA_btl_openib_allow_ib=1

ml purge > /dev/null 2>&1
ml R/4.4.2-gfbf-2024a
ml OpenMPI/5.0.3-GCC-13.3.0 R-bundle-CRAN/2024.11-foss-2024a R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2

mpirun -np 1 R CMD BATCH --no-save --no-restore Rmpi.R output.out 

