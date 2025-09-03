# !/bin/bash -l
# SBATCH -A naiss2024-22-107  # Change to your own after the course
# SBATCH -J job-serial        # name of the job
# SBATCH -n 1                 # nr. tasks
# SBATCH --time=00:05:00 # Asking for 5 minutes
# SBATCH --error=job.%J.err   # error file
# SBATCH --output=job.%J.out  # output file
module load julia/1.8.5

julia serial-sum.jl Arg1 Arg2    # run the serial script
