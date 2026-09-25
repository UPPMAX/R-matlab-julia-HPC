#!/bin/bash
# https://insilicosci.com/install-gromacs-on-windows-and-linux-with-gpu/

echo "Press 15 and press 3 when asked" 
gmx pdb2gmx -f 2wfu.pdb -o protein.gro
gmx grompp -f em.mdp -p topol.top -c protein.gro -o em.tpr -maxwarn 1
gmx mdrun -v -deffnm em -ntmpi 1
