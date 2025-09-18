#!/bin/bash
# A batch script for running the R program parallel_foreach.R
#SBATCH -A naiss2025-22-262
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4

ml purge > /dev/null 2>&1
ml R/4.2.2-hpc1-gcc-11.3.0-bare

# Note: you must make sure you have installed packages "foreach" and 
# "doParallel" before running this. 
# With the above R module loaded, and from the command line, you do: 
# R --quiet --no-save --no-restore -e "install.packages('foreach', repos='http://ftp.acc.umu.se/mirror/CRAN/')"
# R --quiet --no-save --no-restore -e "install.packages('doParallel', repos='http://ftp.acc.umu.se/mirror/CRAN/')" 

# Batch script to submit the R program parallel_foreach.R
R -q --slave -f parallel_foreach.R
