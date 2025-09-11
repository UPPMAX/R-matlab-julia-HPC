#!/bin/bash -l
#SBATCH -n 1                 # nr. tasks/coresw
#SBATCH -A naiss202u-wv-xyz  # your project_ID
#SBATCH --time=00:20:00      # requested time

ml R_packages/4.1.1
Rscript --no-save --no-restore r_script 1
