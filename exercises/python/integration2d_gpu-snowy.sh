#!/bin/bash
#SBATCH -A uppmax2025-2-272 
#SBATCH -t 00:30:00
#SBATCH -n 4
#SBATCH -M snowy
#SBATCH -o output_%j.out   # output file
#SBATCH -e error_%j.err    # error messages
#SBATCH --gres=gpu:1

ml purge > /dev/null 2>&1
module load uppmax python/3.11.8 python_ML_packages/3.11.8-gpu  

python integration2d_gpu.py
python integration2d_gpu_shared.py
