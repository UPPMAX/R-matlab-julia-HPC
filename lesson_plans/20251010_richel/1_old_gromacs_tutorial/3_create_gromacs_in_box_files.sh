#!/bin/bash
# gmx pdb2gmx -f protein_without_water.pdb -o protein
# gmx pdb2gmx -f PEO4.pdb -o protein
# gmx pdb2gmx -f 1BDK.pdb -o protein
#gmx pdb2gmx -f PEO4_wrapped.pdb -o protein

gmx editconf -f protein.gro -o protein_in_box.gro -c -d 1.2 -bt cubic

