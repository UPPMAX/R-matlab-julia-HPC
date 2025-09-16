#!/bin/bash
#SBATCH -n 1                 # nr. tasks
#SBATCH -A lu2025-7-76      # your project_ID
#SBATCH --time=00:20:00      # requested time

ml purge > /dev/null 2>&1
ml GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1
Rscript --no-save --no-restore do_2d_integration.R
