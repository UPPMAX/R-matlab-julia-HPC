#!/bin/bash
#
# Run GROMACS on an example file
#
#SBATCH -A staff
#SBATCH --time=00:10:00 # maximum execution time of
#SBATCH --ntasks=1
#SBATCH --output=run_pelle_1.out
module load OpenMPI/5.0.7-GCC-14.2.0 GROMACS/2024.4-foss-2023b

# Overwrite an exisiting output file, do not create a new version as a backup
export GMX_MAXBACKUP=-1

mpirun -n 1 gmx_mpi mdrun -g run_pelle_1 -nsteps -1 -maxh 0.017 -resethway -notunepme
