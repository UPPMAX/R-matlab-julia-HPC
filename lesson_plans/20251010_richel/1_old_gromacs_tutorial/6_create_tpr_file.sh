#!/bin/bash
gmx grompp -f ions.mdp -c molecule_in_solution.gro -p topol.top -o ions.tpr
