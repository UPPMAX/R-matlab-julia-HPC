#!/bin/bash
#
# Usage:
#
#   ./schedule_rackham_runs.sh [account]
#
# Example:
#
#   ./schedule_rackham_runs.sh staff
#

if [ "$#" -ne 1 ]; then
    echo "ERROR: Incorrect number of arguments"
    echo "when calling 'schedule_rackham_runs.sh'."
    echo " "
    echo "Please add an argument with the name of the Slurm job account::"
    echo " "
    echo "Usage:"
    echo " "
    echo "  ./schedule_rackham_runs.sh [account]"
    echo " "
    echo "Examples:"
    echo " "
    echo "  ./schedule_rackham_runs.sh staff"
    echo " "
fi

slurm_job_account=$1
echo "Slurm job account used: ${slurm_job_account}"

sbatch -A ${slurm_job_account} -n 1 integration2d_rackham.sh
sbatch -A ${slurm_job_account} -n 4 integration2d_rackham.sh
sbatch -A ${slurm_job_account} -n 16 integration2d_rackham.sh
sbatch -A ${slurm_job_account} -n 64 integration2d_rackham.sh
