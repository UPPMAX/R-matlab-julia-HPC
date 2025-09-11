#!/bin/bash
#SBATCH -n 1
#SBATCH -A staff
module load R R_packages
Rscript r_script.R ${SLURM_NTASKS}
