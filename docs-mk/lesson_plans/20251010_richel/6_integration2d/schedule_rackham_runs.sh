#!/bin/bash
for filename in $(ls integration2d_rackham_*.sh)
do
  sbatch ${filename}
done
