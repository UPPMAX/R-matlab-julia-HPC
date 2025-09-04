#!/bin/bash
#
# Run GROMACS on an example file
#
#SBATCH -A staff
#SBATCH --time=00:10:00 # maximum execution time of
##SBATCH ## --nodes=1 # we run on 1 node
#SBATCH --ntasks-per-node=1 # 1 MPI rank
#SBATCH --cpus-per-task=1 # number cpus-per-task

filename=topol.tpr
url=https://github.com/UPPMAX/R-matlab-julia-HPC/raw/refs/heads/main/docs-mk/lesson_plans/20251010_richel/lumi_course/topol.tpr

if [ -e "${filename}" ]; then
  echo "File '${filename}' already exists. Skipping download."
else
  echo "Downloading '${filename}' from '${url}'..."
  wget -O "${filename}" "${url}"
fi

module load GROMACS/2024.4-foss-2023b

gmx_mpi mdrun \
  -g ex1.1_${SLURM_NTASKS}x${OMP_NUM_THREADS}_jID${SLURM_JOB_ID} \
  -nsteps -1 -maxh 0.017 -resethway -notunepme
