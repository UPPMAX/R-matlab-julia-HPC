#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A NAISS2025-22-934
#SBATCH -t 00:30:00
#SBATCH -p alvis
#You always need to ask for GPUs on Alvis! And you should not use it for anything but GPU jobs! 
#SBATCH -N 1 --gpus-per-node=T4:1

ml purge > /dev/null 2>&1
module load MATLAB/2024b

matlab -singleCompThread -nodisplay -nosplash -r "gpu-matlab-script.m"

