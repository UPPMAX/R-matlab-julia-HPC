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

??? info "Learning outcomes"

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

     HPC cluster| Login method           | Location                                                 |
     -----------+------------------------+-------------------------------------
     COSMOS     | Local ThinLinc client  | [Here](https://youtu.be/sSWd54Gunck)
     Dardel     | Local ThinLinc client  | [Here](https://youtu.be/xBFH7Ab37FU)
     Kebnekaise | Local ThinLinc client  | [Here](https://youtu.be/miAxHkSePIA)
     Rackham    | Local ThinLinc client  | [Here](https://youtu.be/fSUYE_Xahe8)
     Tetralith  | Local ThinLinc client  | [Here](https://youtu.be/HxBtyCB3w0k)


HPC cluster name |Main breakout room
-----------------+------------------
Alvis            |.             
Bianca           |.             
COSMOS           |Room 1             
Dardel           |Room 2             
Kebnekaise       |Room 3             
LUMI             |.
Pelle            |.
Rackham          |Room 4             
Tetralith        |Room 5             

## Exercise 1: start the R interpreter

- Find the user documentation of your HPC cluster

??? hint "Answer"

    HPC cluster| User documentation for that HPC cluster
    -----------+-----------------------------------------------------------------------------------
    Alvis      | .
    Bianca     | [User documentation](http://docs.uppmax.uu.se/)
    COSMOS     | [User documentation](https://lunarc-documentation.readthedocs.io/en/latest)
    Dardel     | [User documentation](https://support.pdc.kth.se/doc/contact/contact_support/)
    Kebnekaise | [User documentation](https://docs.hpc2n.umu.se/)
    LUMI       | .
    Pelle      | [User documentation](http://docs.uppmax.uu.se/)
    Rackham    | [User documentation](http://docs.uppmax.uu.se/)
    Tetralith  | [User documentation](https://www.nsc.liu.se/support/systems/tetralith-getting-started/)

- Within the documentation of your HPC cluster, search for the documentation about R

??? hint "Answer"

    HPC cluster| R user documentation for that HPC cluster
    -----------+----------------------------------------------------------------------------------------------------------------
    Alvis      | .
    Bianca     | [R user documentation](https://docs.uppmax.uu.se/software/r/)
    COSMOS     | [R user documentation](https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Rscript/)
    Dardel     | [R user documentation](https://support.pdc.kth.se/doc/applications/?sub=r/)
    Kebnekaise | [R user documentation](https://www.hpc2n.umu.se/resources/software/r)
    LUMI       | .
    Pelle      | [R user documentation](https://docs.uppmax.uu.se/software/r/)
    Rackham    | [R user documentation](https://docs.uppmax.uu.se/software/r/)
    Tetralith  | [R user documentation](https://www.nsc.liu.se/software/catalogue/tetralith/modules/r.html)

- From the terminal, load the module(s) for R,
  of the recommend version as shown below

HPC center|R version
----------+---------
Alvis     |?
Bianca    |?4.1.1    
COSMOS    |4.2.1    
Dardel    |4.1.1    
Kebnekaise|4.1.2    
LUMI      |?
Pelle     |?4.1.1    
Rackham   |4.1.1    
Tetralith |4.2.2    

??? hint "Answer"

    HPC cluster| How to load the module(s) for R                                                                                
    -----------+----------------------------------------------------------------------------------------------------------------
    Alvis      | .
    Bianca     | `module load R/4.1.1`                                                                                    
    COSMOS     | `module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1`                                                           
    Dardel     | `module load PDC/23.12 R/4.1.1`                                                                          
    Kebnekaise | `module load GCC/11.2.0 OpenMPI/4.1.1 R/4.1.2`                                                           
    LUMI       | .
    Pelle      | `module load R/4.1.1`                                                                                    
    Rackham    | `module load R/4.1.1`                                                                                    
    Tetralith  | `module load R/4.2.2-hpc1-gcc-11.3.0-bare`                                                               

- From the terminal, start the R interpreter

??? hint "Answer"

    HPC cluster| How to start the R interpreter   
    -----------+----------------------------------
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
    -----------+----------------------------------
    Alvis      | `installed.packages()`     |
    Bianca     | `installed.packages()`     |
    COSMOS     | `installed.packages()`     |
    Dardel     | `installed.packages()`     |
    Kebnekaise | `installed.packages()`     |
    LUMI       | `installed.packages()`     |
    Pelle      | `installed.packages()`     |
    Rackham    | `installed.packages()`     |
    Tetralith  | `installed.packages()`     |

- From the R interpreter, load the `parallel` package,
  using `library(parallel)`

??? hint "Answer"

    HPC cluster| Answer                            
    -----------+----------------------------------
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
    -----------+----------------------------------
    Alvis      | `module spider R`          
    Bianca     | `module spider R`          
    COSMOS     | `module spider R`          
    Dardel     | `module spider R`          
    Kebnekaise | `module spider R`          
    LUMI       | .
    Pelle      | `module spider R`          
    Rackham    | `module spider R`          
    Tetralith  | `module spider R`          
