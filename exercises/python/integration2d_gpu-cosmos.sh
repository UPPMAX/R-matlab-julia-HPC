#!/bin/bash
#SBATCH -A lu2025-7-24
#SBATCH -t 00:30:00
#SBATCH -n 24
#SBATCH -o output_%j.out   # output file
#SBATCH -e error_%j.err    # error messages
#SBATCH --ntasks-per-node=1
#SBATCH -p gpua100
#SBATCH --gres=gpu:1
#SBATCH --exclusive

ml purge > /dev/null 2>&1
module load GCC/11.3.0  OpenMPI/4.1.4 numba/0.56.4-CUDA-11.7.0 
module load SciPy-bundle/2022.05

python integration2d_gpu.py
python integration2d_gpu_shared.py
