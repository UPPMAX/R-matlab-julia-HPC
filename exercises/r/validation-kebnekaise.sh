#!/bin/bash
#SBATCH -A hpc2n2025-151 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.2.1 and prerequisites + R-bundle-Bioconductor/3.15-R-4.2.1
module load GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1 R-bundle-Bioconductor/3.15-R-4.2.1

#install datarium before running this batch script 
#Start R
#install.packages('datarium', repos='http://ftp.acc.umu.se/mirror/CRAN/') 

# Run your R script, here 'validation.R'. Give the path if it is not located in the same directory as you submit this script
R --no-save --quiet < validation.R
