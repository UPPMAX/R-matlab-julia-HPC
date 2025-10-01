#!/bin/bash
#SBATCH -A hpc2n2025-151 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 1
#SBATCH --cpus-per-task=8
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
module load GCC/13.2.0 R/4.4.1
module load OpenMPI/4.1.6 R-bundle-CRAN/2024.06
module load R-bundle-Bioconductor/3.19-R-4.4.1

srun Rscript MyRscript.R

