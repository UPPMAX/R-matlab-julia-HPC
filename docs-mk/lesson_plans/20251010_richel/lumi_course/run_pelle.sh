#!/bin/bash

filename=topol.tpr
url=https://github.com/UPPMAX/R-matlab-julia-HPC/raw/refs/heads/main/docs-mk/lesson_plans/20251010_richel/lumi_course/topol.tpr

if [ -e "${filename}" ]; then
  echo "File '${filename}' already exists. Skipping download."
else
  echo "Downloading '${filename}' from '${url}'..."
  wget -O "${filename}" "${url}"
fi
