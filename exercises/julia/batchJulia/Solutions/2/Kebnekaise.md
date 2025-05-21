#!/bin/bash
#SBATCH -A hpc2n2023-110     # your project_ID
#SBATCH -J job-serial        # name of the job
#SBATCH -n 1                 # nr. tasks
#SBATCH --time=00:03:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file
#SBATCH --gres=gpu:k80:1     # 1 GPU K80 card

ml purge  > /dev/null 2>&1
ml Julia/1.8.5-linux-x86_64
ml CUDA/11.4.1

julia script-gpu.jl


#Output:
#0.689096 seconds (2.72 M allocations: 132.617 MiB, 6.27% gc time, 99.62% compilation time)

#1.194153 seconds (1.24 M allocations: 62.487 MiB, 3.41% gc time, 55.13% compilation time)

#0.000933 seconds (2 allocations: 512.047 KiB)

#0.000311 seconds (5 allocations: 192 bytes)
