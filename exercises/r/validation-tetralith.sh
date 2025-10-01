#!/bin/bash
#SBATCH -A naiss2025-22-934 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need
module load R/4.4.0-hpc1-gcc-11.3.0-bare

#install datarium before running this batch script 
#Start R
#install.packages('datarium', repos='http://ftp.acc.umu.se/mirror/CRAN/') 
# If you did not previously install caret and tidyverse, do so as well

# Run your R script (here 'validation.R'. Give the path if it is not located in the same directory)
R --no-save --quiet < validation.R
