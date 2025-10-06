---
tags:
  - R
  - run
  - load
---

# Load and run R

!!! info "Learning outcomes"

    - Practice using the documentation of your HPC cluster
    - Load an R module
    - Start the R interpreter
    - Run an R script
    - Download and extract the exercise files
    - (optional) Find the different R modules
    - (optional) See the list of installed R packages

???- note "For teachers"

    Teaching goals are:

    - Learners have practiced using the documentation of their HPC clusters
    - Learners have loaded the module to be able to run R
    - Learners have run the R interpreter
    - Learners have run an R script from the command-line
    - Learners have downloaded and extracted the exercise files
    - (optional) Learners have found the different R modules
    - (optional) Learners have seen the list of installed R packages

    Prior:

    - What is 'HPC' in 'HPC cluster'?
    - What is 'cluster' in 'HPC cluster'?
    - What is a software module?
    - What is a script?
    - What are features of using an HPC cluster?
    - What problem would arise if users can install their own software?


## Introduction

You want to run R on an HPC cluster.
For this, you'll need to read the documentation
of your HPC cluster.

In this session, we will use the documentation of your HPC cluster
to start R.

!!! warning "Only do lightweight things!"

    Only do lightweight things!

    We are still on the login node, which is shared with many other users.
    This means, that if we do heavy calculations, all the other users
    are affected.

    How to do heavy calculations will be shown in this course later.

## Exercises

???- note "Prefer this session as video?"

     HPC cluster| Login method           | YouTube video
     -----------|------------------------|-------------------------------------
     COSMOS     | Local ThinLinc client  | [YouTube video](https://youtu.be/sSWd54Gunck)
     Dardel     | Local ThinLinc client  | [YouTube video](https://youtu.be/xBFH7Ab37FU)
     Kebnekaise | Local ThinLinc client  | [YouTube video](https://youtu.be/miAxHkSePIA)
     Pelle      | SSH                    | [YouTube video](https://youtu.be/F37ji6o7SY4)
     Rackham    | Local ThinLinc client  | [YouTube video](https://youtu.be/fSUYE_Xahe8)
     Tetralith  | Local ThinLinc client  | [YouTube video](https://youtu.be/HxBtyCB3w0k)


HPC cluster name |Main breakout room
-----------------|------------------
Alvis            |Room 1
Bianca           |Room 2
COSMOS           |Room 3
Dardel           |Room 4
Kebnekaise       |Room 5
LUMI             |Room 6
Pelle            |Room 7
Rackham          |Room 8
Tetralith        |Room 9

## Exercise 1: start the R interpreter

- Find the user documentation of your HPC cluster

??? hint "Answer"

    <!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

    HPC cluster| User documentation for that HPC cluster
    -----------|-----------------------------------------------------------------------------------
    Alvis      | [Alvis user documentation](https://www.c3se.chalmers.se/about/Alvis/)
    Bianca     | [Bianca user documentation](http://docs.uppmax.uu.se/)
    COSMOS     | [COSMOS user documentation](https://lunarc-documentation.readthedocs.io/en/latest)
    Dardel     | [Dardel user documentation](https://support.pdc.kth.se/doc/contact/contact_support/)
    Kebnekaise | [Kebnekaise user documentation](https://docs.hpc2n.umu.se/)
    LUMI       | [LUMI user documentation](https://docs.lumi-supercomputer.eu/)
    Pelle      | [Pelle user documentation](http://docs.uppmax.uu.se/)
    Rackham    | [Rackham user documentation](http://docs.uppmax.uu.se/)
    Tetralith  | [Tetralith user documentation](https://www.nsc.liu.se/support/systems/tetralith-getting-started/)

    <!-- markdownlint-enable MD013 -->

- Within the documentation of your HPC cluster, search for the documentation about R

??? hint "Answer"

    HPC cluster| R user documentation for that HPC cluster
    -----------|----------------------------------------------------------------------------------------------------------------
    Bianca     | [R user documentation](https://docs.uppmax.uu.se/software/r/)
    COSMOS     | [R user documentation](https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Rscript/)
    Dardel     | [R user documentation](https://support.pdc.kth.se/doc/applications/?sub=r/)
    Kebnekaise | [R user documentation](https://www.hpc2n.umu.se/resources/software/r)
    Pelle      | [R user documentation](https://docs.uppmax.uu.se/software/r/)
    Rackham    | [R user documentation](https://docs.uppmax.uu.se/software/r/)
    Tetralith  | [R user documentation](https://www.nsc.liu.se/software/catalogue/tetralith/modules/r.html)

- From a terminal on your HPC cluster,
  load the module(s) for R,
  of the recommend version as shown below

HPC center|R module
----------|---------
COSMOS    |`R/4.2.1`
Dardel    |`R/4.1.1`
Kebnekaise|`R/4.1.2`
Pelle     |`R/4.5.1-gfbf-2024a`
Rackham   |`R/4.1.1`
Tetralith |`R/4.2.2`

??? hint "Answer"

    HPC cluster| How to load the module(s) for R
    -----------|----------------------------------------------------------------------------------------------------------------
    Bianca     | `module load R/4.1.1`
    COSMOS     | `module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1`
    Dardel     | `module load PDC/23.12 R/4.1.1`
    Kebnekaise | `module load GCC/11.2.0 OpenMPI/4.1.1 R/4.1.2`
    Pelle      | `module load 4.5.1-gfbf-2024a`
    Rackham    | `module load R/4.1.1`
    Tetralith  | `module load R/4.2.2-hpc1-gcc-11.3.0-bare`

- From the terminal, start the R interpreter

??? hint "Answer"

    HPC cluster| How to start the R interpreter
    -----------|----------------------------------
    Alvis      | `R`
    Bianca     | `R`
    COSMOS     | `R`
    Dardel     | `R`
    Kebnekaise | `R`
    LUMI       | `R`
    Pelle      | `R`
    Rackham    | `R`
    Tetralith  | `R`

- From the R interpreter, run the R code `message("Hello")`
  to verify if this
  makes the R interpreter show the text 'Hello'

- From the R interpreter, run the R code `quit()`
  to quit the R interpreter
  and go back to the terminal


## Exercise 2: run an R script

To run an R script, we'll download one, after which we'll run it:

- From the terminal, run `wget https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/r/hello.R`

- From the terminal, run `Rscript hello.R`

## Exercise 3: download and extract the tarball with exercises

See [how to download and use the tarball](../common/use_tarball.md)
how to download and extract the tarball with exercises.

## Exercise X1: find and use installed R packages

- From the R interpreter, check which packages are installed,
  using `installed.packages()`

??? hint "Answer"

    HPC cluster| Answer
    -----------|----------------------------------
    Alvis      | `installed.packages()`
    Bianca     | `installed.packages()`
    COSMOS     | `installed.packages()`
    Dardel     | `installed.packages()`
    Kebnekaise | `installed.packages()`
    LUMI       | `installed.packages()`
    Pelle      | `installed.packages()`
    Rackham    | `installed.packages()`
    Tetralith  | `installed.packages()`

- From the R interpreter, load the `parallel` package,
  using `library(parallel)`

??? hint "Answer"

    HPC cluster| Answer
    -----------|----------------------------------
    Alvis      | `library(parallel)`
    Bianca     | `library(parallel)`
    COSMOS     | `library(parallel)`
    Dardel     | `library(parallel)`
    Kebnekaise | `library(parallel)`
    LUMI       | `library(parallel)`
    Pelle      | `library(parallel)`
    Rackham    | `library(parallel)`
    Tetralith  | `library(parallel)`


## Exercise X2: search for other R versions

Use the module system to find which versions of R are provided
by your cluster's module system.

??? hint "Answer"

    HPC cluster| How to search for the R modules
    -----------|----------------------------------
    Alvis      | `module spider R`
    Bianca     | `module spider R`
    COSMOS     | `module spider R`
    Dardel     | `module spider R`
    Kebnekaise | `module spider R`
    Pelle      | `module spider R`
    Rackham    | `module spider R`
    Tetralith  | `module spider R`
