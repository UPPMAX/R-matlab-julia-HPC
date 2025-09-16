#!/bin/bash
#
# Usage:
#
#   sbatch -A [account] schedule_rackham_runs.sh
#
# Example:
#
#   sbatch -A staff schedule_rackham_runs.sh
#

echo "Slurm job accoun used: ${SLURM_JOB_ACCOUNT}"
sbatch -A ${SLURM_JOB_ACCOUNT} -n 2 integration2d_rackham_x.sh

exit

for filename in $(ls integration2d_rackham_*.sh)
do
  sbatch ${filename}
done
