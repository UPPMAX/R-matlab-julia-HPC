#!/bin/bash
#SBATCH -A hpc2n2025-062 # Change to your own after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
# Asking for one A100 card
#SBATCH --gpus=1
#SBATCH -C a100 

# Load any modules you need
module load GCC/12.3.0 OpenMPI/4.1.5 TensorFlow/2.15.1-CUDA-12.1.1 SciPy-bundle/2023.07 scikit-learn/1.4.2

# If you are using the example named "my_tf_program.py" in this directory, 
# you need to create and activate a virtual environment containing 
# scikit learn. Do these steps: 
#
# module load GCC/11.2.0 OpenMPI/4.1.1 Python/3.9.6 SciPy-bundle/2021.10 TensorFlow/2.7.1
# virtualenv --system-site-packages <path-to-install-dir>/tf-venv
# source <path-to-install-dir>/tf-venv/bin/activate
# pip install --no-cache-dir --no-build-isolation scikit-learn 
#
# Then remove the below outcommenting so the virtual environment gets activated in the batch job (and add the correct path) 
# source <path-to-install-dir>/tf-venv/bin/activate

# Run your Python script
python my_tf_program.py
