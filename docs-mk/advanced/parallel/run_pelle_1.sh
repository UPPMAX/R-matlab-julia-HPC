#!/bin/bash
#
# Run GROMACS on an example file
#
#SBATCH -A staff
#SBATCH --time=00:10:00 # maximum execution time of
#SBATCH --ntasks=1
#SBATCH --output=run_pelle_1.out
module load GROMACS/2024.4-foss-2023b
srun gmx_mpi mdrun -g run_pelle_1 -nsteps -1 -maxh 0.017 -resethway -notunepme
