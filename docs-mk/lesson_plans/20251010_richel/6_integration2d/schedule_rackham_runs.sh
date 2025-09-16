#!/bin/bash
sbatch integration2d_rackham_x.sh -A staff --cpus-per-task 1
sbatch integration2d_rackham_x.sh -A staff --cpus-per-task 2
sbatch integration2d_rackham_x.sh -A staff --cpus-per-task 4
sbatch integration2d_rackham_x.sh -A staff --cpus-per-task 8
sbatch integration2d_rackham_x.sh -A staff --cpus-per-task 16
sbatch integration2d_rackham_x.sh -A staff --cpus-per-task 32
