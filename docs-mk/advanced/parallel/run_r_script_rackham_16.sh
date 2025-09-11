#!/bin/bash -l
#SBATCH -n 16                # nr. tasks/coresw
#SBATCH -A staff
#SBATCH --time=00:20:00      # requested time

ml R_packages/4.1.1
Rscript --no-save --no-restore r_script 16
