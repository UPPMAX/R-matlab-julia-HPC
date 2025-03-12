#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A uppmax2025-2-272
# We are asking for 5 minutes
#SBATCH --time=00:05:00
#SBATCH -n 1
#SBATCH -M snowy
#SBATCH --gres=gpu:1

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load uppmax python/3.11.8 python_ML_packages/3.11.8-gpu 

# DO THIS BEFORE SUBMITTING!
# BEGIN
# Create a virtual environment and install scikit-learn and TensorFlow 
# Do the following:
# Start an interactive job on Snowy: 
# interactive -A uppmax2025-2-272 -n 1 -M snowy --gres=gpu:1  -t 1:00:01
# Load some modules 
# module load uppmax python/3.11.8 python_ML_packages/3.11.8-gpu
# Create the venv, activate it, and install to it 
# python -m venv --system-site-packages scikit-venv
# source scikit-venv/bin/activate
# pip install --upgrade --force-reinstall --no-cache-dir --no-build-isolation tensorrt tensorflow scikit-learn
# deactivate
# Now you can submit with "sbatch scikit-learn-snowy.sh" 
# END 

# Activate the virtual environment we installed to
source scikit-venv/bin/activate

# Run your Python script
python scikit-learn.py
