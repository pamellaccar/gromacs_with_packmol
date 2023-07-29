<h1 align="center"> GROMACS Simulations  </h1> 

Download the structure from the Protein Data Bank (PDB): In this case we're using 2muj.pdb, a Plasmodium falciparum peptide. 

**First step:** Initial configuration and topology, adding Hydrogens using pdb2gmx.

```gmx_mpi pdb2gmx -f 2muj.pdb -o 2muj_H.pdb -ignh```

select CHARMM36m force field and tip3p water model.


**Second step:** Building the box with PACKMOL.
The peptide has 41 Angstroms size, so we're going to define 15 Angstroms for each side of the box: 41+15=56 Angstroms approximately.

```./solvate.tcl 2muj_H.pdb -shell 15. -charge -1 -density 1.0 -o solvated.pdb```

paste into packmol input file:

``` tolerance 2.0

filetype pdb

seed -1

add_box_sides 1.0

output solvated.pdb

```

and run:

```packmol < packmol_input.inp```

Put the solvent and ion number in the end of the topology file (check the names in each force field). E.g.:

```
#ifdef POSRES_WATER
; Position restraint for each water oxygen
[ position_restraints ]
;  i funct       fcx        fcy        fcz
   1    1       1000       1000       1000
#endif

; Include topology for ions
#include "./charmm36-jul2021.ff/ions.itp"

[ system ]
; Name
SERINE-REPEAT ANTIGEN PROTEIN

[ molecules ]
; Compound        #mols
Protein_chain_A     1
SOL                4903
SOD                14
CLA                13
```


**Third step:** Build mdp files for each force field and run minimization.

```gmx_mpi grompp -f mim.mdp -c solvated.pdb -r solvated.pdb -p topol.top -o minim.tpr -pp processed.top -maxwarn 1```

```gmx_mpi mdrun -v -deffnm minim```


**Fourth step:** Run equilibration and choose ensembles.

NVT equilibration

```gmx_mpi grompp -f nvt.mdp -c minim.gro -r minim.gro -p topol.top -o nvt.tpr```

```gmx_mpi mdrun -deffnm npt```

NPT equilibration

```gmx_mpi grompp -f npt.mdp -c nvt.gro -r nvt.gro -p topol.top -o npt.tpr```

```gmx_mpi mdrun -deffnm npt```


**Fifth step:** MD production 

```gmx_mpi grompp -f md.mdp -c npt.gro -p topol.top -o md.tpr```

```gmx_mpi mdrun -deffnm md```

GROMACS reminds you: "Creativity in science, as in art, cannot be organized. It arises spontaneously from individual talent. Well-run laboratories can foster it, but hierarchical organizations, inflexible bureaucratic rules, and mountains of futile paperwork can kill it." (Max Perutz)

<h2> That's all folks! </h2>  

***(for now)***
