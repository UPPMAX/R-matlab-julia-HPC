#!/bin/bash
#SBATCH -A hpc2n2025-151 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.4.1 and prerequisites + R-bundle-CRAN/2024.06 and R-bundle-Bioconductor/3.19-R-4.4.1 
module load GCC/13.2.0 R/4.4.1 
module load OpenMPI/4.1.6 R-bundle-CRAN/2024.06 R-bundle-Bioconductor/3.19-R-4.4.1

# Run your R script (here 'iris_ml.R')
R --no-save --quiet < iris_ml.R

