#!/bin/bash
#SBATCH -n 1
#SBATCH -A lu2024-7-68
#SBATCH --time=00:20:00
#
# Use 'projinfo' to see all your accounts
#
module purge > /dev/null 2>&1
module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1
Rscript --no-save --no-restore do_2d_integration.R 1
