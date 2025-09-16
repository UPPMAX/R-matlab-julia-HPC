#!/bin/bash
#SBATCH -A lu2024-7-68
#lu2024-7-80            0.00               10000
#lu2025-2-94            0.00               10000
#lu2025-7-17            0.00                5000
#lu2025-7-24            0.00               10000
#lu2025-7-34            0.00                5000
# FAILS lu2025-7-76

#SBATCH -n 1
#SBATCH --time=00:20:00
#
# Use 'projinfo' to see all your account
#
ml purge > /dev/null 2>&1
ml GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1
Rscript --no-save --no-restore do_2d_integration.R
