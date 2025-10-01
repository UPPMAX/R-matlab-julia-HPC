#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A naiss2025-22-934
# Asking for runtime: hours, minutes, seconds. At most 1 week
#SBATCH --time=03:00:00
# Ask for resources, including GPU resources
#SBATCH -n 1
#SBATCH -c 32
#SBATCH --gpus-per-task=1

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
ml buildenv-gcccuda/11.6.2-gcc9-hpc1
ml buildtool-easybuild/4.9.4-hpc71cbb0050
ml Miniforge/24.7.1-2-hpc1
conda activate myenv
mamba activate R  

R --no-save --no-restore -f gpu-script-db-higgs.R

