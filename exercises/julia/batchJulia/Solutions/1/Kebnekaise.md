# !/bin/bash
# SBATCH -A hpc2n2024-025     # your project_ID
# SBATCH -J job-serial        # name of the job
# SBATCH -n 1                 # nr. tasks
# SBATCH --time=00:03:00      # requested time
# SBATCH --error=job.%J.err   # error file
# SBATCH --output=job.%J.out  # output file

ml purge  > /dev/null 2>&1   # recommended purge
ml Julia/1.8.5-linux-x86_64  # Julia module

julia serial-sum.jl Arg1 Arg2    # run the serial script
