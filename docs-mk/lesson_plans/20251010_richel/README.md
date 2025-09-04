# Lesson plan Advanced by Richel

- Date: Tuesday 2025-10-06
- Course: Advanced

## 2025-09-04

I need to improve the SCoRe user documentation on using HPC
resources efficiently. This goes perfectly hand-in-hand
with the parallel computing session.

As the parallel session is language agnostic, I do not need to use
R, Julia or MATLAB code at all.
Instead, I can use BEAST2.

From the first 1000 lines of UPPMAX modules, these were labelled
to be the most popular: GROMACS, BWA, Bowtie2, ABySS, GATK, BEDTools.
I also heard of LINPACK and BLAST.

Let's start with GROMACS, as it is popular and available on Pelle.

- [YouTube video](https://www.youtube.com/watch?v=-S1eP-iWE8c)
- [1UN3 RCSB page](https://www.rcsb.org/structure/1UN3)
- Downloaded [`1UN3.pdb`](1UN3.pdb)

```bash
sudo apt install jmol
jmol 1UN3.pdb
```

![`jmol` shows the `1UN3` protein](jmol_works.png)
