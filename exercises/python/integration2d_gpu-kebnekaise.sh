#!/bin/bash
#SBATCH -A hpc2n2025-062
#SBATCH -t 00:30:00
#SBATCH -N 1
#SBATCH -n 28
#SBATCH -o output_%j.out   # output file
#SBATCH -e error_%j.err    # error messages
#SBATCH --gpus=2
#SBATCH -C v100
#SBATCH --exclusive

ml purge > /dev/null 2>&1
module load GCC/12.3.0  OpenMPI/4.1.5 Python/3.11.3 SciPy-bundle/2023.07 CUDA/12.1.1 numba/0.58.1

python integration2d_gpu.py
python integration2d_gpu_shared.py
