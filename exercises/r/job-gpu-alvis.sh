#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A NAISS2025-22-934
#SBATCH -t 03:00:00
#SBATCH -p alvis
#SBATCH -N 1 --gpus-per-node=T4:1

ml purge > /dev/null 2>&1
module load R/4.2.1-foss-2022a CUDA/12.9.1 

R --no-save --no-restore -f gpu-script-db-higgs.R

