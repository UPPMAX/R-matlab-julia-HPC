#!/bin/bash
#
# Run GROMACS on an example file
#
#SBATCH -A staff
#SBATCH --time=00:10:00 # maximum execution time of
#SBATCH --ntasks=8
#SBATCH --output=run_pelle_8.out

filename=topol.tpr
url=https://github.com/UPPMAX/R-matlab-julia-HPC/raw/refs/heads/main/docs-mk/lesson_plans/20251010_richel/lumi_course/topol.tpr

if [ -e "${filename}" ]; then
  echo "File '${filename}' already exists. Skipping download."
else
  echo "Downloading '${filename}' from '${url}'..."
  wget -O "${filename}" "${url}"
fi

module load GROMACS/2024.4-foss-2023b

srun gmx_mpi mdrun -g run_pelle_8 -nsteps -1 -maxh 0.017 -resethway -notunepme
