#!/bin/bash
for filename in $(ls integration2d_cosmos_*.sh)
do
  sbatch ${filename}
done
