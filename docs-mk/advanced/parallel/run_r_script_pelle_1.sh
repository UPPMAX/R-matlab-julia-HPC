#!/bin/bash
#SBATCH -n 1
#SBATCH -A staff
#SBATCH --output "pelle_1.txt"
module load R R_packages
Rscript r_script.R ${SLURM_NTASKS}
