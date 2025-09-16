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

- [GROMACS on LUMI course](https://zenodo.org/records/10683366)



To run on Pelle:


```
wget https://github.com/UPPMAX/R-matlab-julia-HPC/raw/refs/heads/main/docs-mk/lesson_plans/20251010_richel/lumi_course/run_pelle.sh
sbatch run_pelle.sh 
```

Need to use `srun`

## 2025-09-11

I think this was a bad idea: the course is an R and MATLAB and Julia course.
Let's change the learning outcome to run a script in one of those
languages.

## 2025-09-16

I am going to start with the MPI scripts now.
They work!
And then I find out that OpenMPI is not OpenMP.

I feel:

Technique|Uses                            |Notes
---------|--------------------------------|--------------
Normal   |1 core                          |
OpenMP   |1 to all cores on a node        |A threaded mechanism, uses `OMP_NUM_THREADS`
OpenMPI  |1 to all cores on multiple nodes|`Rmpi` package

Works:

```bash
$ sbatch integration2d-rackham_8.sh 
Submitted batch job 56823317

[richel@rackham3 6_integration2d]$ cat slurm-56823317.out
R_packages/4.1.1: The RStudio packages pane is disabled when loading this module, due to performance issues. All packages are still available.
R_packages/4.1.1: For more information and instructions to re-enable it, see 'module help R_packages/4.1.1'

Loading required package: foreach
Loading required package: iterators
[1] "Integral value is 9.07607322631065e-15 Error is 9.07607322631065e-15"
[1] "Time spent: 0.263934373855591 seconds"
```


