#!/bin/bash
# gmx pdb2gmx -f protein_without_water.pdb -o protein
# gmx pdb2gmx -f PEO4.pdb -o protein
# gmx pdb2gmx -f 1BDK.pdb -o protein
#gmx pdb2gmx -f PEO4_wrapped.pdb -o protein

gmx solvate -cp protein_in_box.gro -o molecule_in_solution.gro -p topol.top -cs spc216.gro 

  
