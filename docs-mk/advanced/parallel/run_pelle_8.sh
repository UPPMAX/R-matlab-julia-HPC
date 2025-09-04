#!/bin/bash
#
# Run GROMACS on an example file
#
#SBATCH -A staff
#SBATCH --time=00:10:00 # maximum execution time of
#SBATCH --ntasks=8
#SBATCH --output=run_pelle_8.out
module load OpenMPI/5.0.7-GCC-14.2.0 GROMACS/2024.4-foss-2023b
srun gmx_mpi mdrun -g run_pelle_8 -nsteps -1 -maxh 0.017 -resethway -notunepme
