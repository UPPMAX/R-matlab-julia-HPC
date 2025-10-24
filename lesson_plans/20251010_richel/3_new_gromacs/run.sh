#!/bin/bash
set -e

# 1. Generate topology, ignore hydrogens
gmx pdb2gmx -f water.pdb -o water.gro -p topol.top -ignh << EOF
1
1
EOF

# 2. Define box
gmx editconf -f water.gro -o water_box.gro -c -d 1.0 -bt cubic

# 3. Solvate
gmx solvate -cp water_box.gro -cs spc216.gro -o water_solv.gro -p topol.top

# 4. Prepare energy minimization
gmx grompp -f em.mdp -c water_solv.gro -p topol.top -o em.tpr

# 5. Run energy minimization
gmx mdrun -deffnm em

echo "Energy minimization complete!"
