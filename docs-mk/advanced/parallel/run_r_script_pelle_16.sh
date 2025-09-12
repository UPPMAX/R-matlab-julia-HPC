#!/bin/bash
#SBATCH -n 16
#SBATCH -A staff
#SBATCH --output "pelle_16.txt"
module load R R_packages
Rscript r_script.R ${SLURM_NTASKS}
