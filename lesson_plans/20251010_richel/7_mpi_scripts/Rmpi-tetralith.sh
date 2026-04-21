#!/bin/bash
#SBATCH -A naiss2025-22-262
# Asking for 15 min.
#SBATCH -t 00:15:00
#SBATCH -n 8
#SBATCH --exclusive

ml purge > /dev/null 2>&1
ml R/4.2.2-hpc1-gcc-11.3.0-bare

# Note: Rmpi does not work at NSC. For NSC you first need to install 
# “pdbMPI”: 
# (module load R/4.4.0-hpc1-gcc-11.3.0-bare, start R, install.packages('pbdMPI'))

srun --mpi=pmix Rscript pbdMPI.R 
