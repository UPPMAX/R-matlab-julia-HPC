#!/bin/bash
#SBATCH -A staff
module load R
Rscript -e 'install.packages(c("testthat", "doParallel"), repos = "http://cran.us.r-project.org"))'
