# Introduction R

![The R logo](r_logo_50.png)

???- note "Prefer this session as video?"
    See [this YouTube video](https://youtu.be/N-TRzv9LdF4)
    to see this session as a video.

!!! note "Learning outcomes"

    - see a first overview of the R programming language
    - see the overview of the course
    - hear about 'the tarball with exercises'

???- note "For teachers"

    Learning outomes are:

    - Learners have seen an overview of the course
    - Learners have seen an first overview of the R programming language

    Priors:

    - What is R?
    - What are features of R?
    - What are R packages?
    - What is the R interpreter?
    - What is RStudio?

!!! note "Course learning outcomes"

    - use the module system to load R
    - use the module system to load site-installed R packages
    - find out which versions of R and packages are installed
    - run R scripts
    - write a batch script for running R
    - install R packages from CRAN
    - see how to install other R packages yourself
    - start batch jobs
    - run RStudio

    on the NAISS clusters COSMOS, Dardel, Kebnekaise, Rackham and Tetralith.

!!! note "Course non-goals"

    - improve R coding skills
    - use R on other HPC clusters
    - transfer files (tip: see [the NAISS 'File transfer' course](https://uppmax.github.io/naiss_file_transfer_course/))

## First overview of R

R is a programming language for statistical computing and data visualization
([Wikipedia](https://en.wikipedia.org/wiki/R_(programming_language))).

```mermaid
graph TD

    subgraph r[R]
      r_interpreter[the R interpreter]
      r_packages[R packages]
      r_language[the R programming language]
      r_dev[R software development]
      rstudio[RStudio]

      interpreted_language[Interpreted]
      cran[CRAN]
    end

    r_language --> |has| r_dev
    r_language --> |is| interpreted_language
    r_language --> |uses| r_packages
    interpreted_language --> |done by| r_interpreter
    r_packages --> |maintained by| cran
    r_dev --> |commonly done in| rstudio
```

The main general R resources are:

- [The R homepage](https://www.r-project.org/)
- [The official R documentation](https://cran.r-project.org/manuals.html)
- [The CRAN homepage](https://cran.r-project.org/)

R is used in many NAISS centres:

- [An overview of NAISS centres and their R documentation](http://docs.uppmax.uu.se/software/r/#overview-of-naiss-centers-and-their-documentation-about-r)
- [An (incomplete) overview of R courses being taught at NAISS](http://docs.uppmax.uu.se/software/r/#learning-r)


## Schedule

```mermaid
graph TD

    subgraph login[HPC login]
      ssh[0.SSH]
      remote_desktop_website[5.Remote desktop website]
      remote_desktop_local_thinlinc_client[5.Remote desktop with local ThinLinc client]
    end
    subgraph scheduler[scheduler]
      running_batch_jobs[3.Running batch jobs]
      running_interactive_session[5.Running an interactive session]
    end

    login --> |allows for| scheduler

```

```mermaid
graph TD

    subgraph r[R]
      r_interpreter[1.the R interpreter]
      r_packages[2.R packages]
      r_virtual_environments[2.R virtual environments]
      r_language[1.the R programming language]
      parallel_and_multithreaded_functions[3.Parallel and multithreaded functions]
      r_dev[5.R software development]
      rstudio[5.RStudio]
      ml[4.Machine learning]
      interpreted_language[1.Interpreted]
      cran[1.CRAN]
    end
    subgraph modules[modules]
      r_module[1.R module]
      r_packages_module[2.R_packages module]
      rstudio_module[5.RStudio module]
    end


    r_language --> |has| r_dev
    r_language --> |is| interpreted_language
    r_language --> |uses| r_packages
    interpreted_language --> |done by| r_interpreter
    r_packages --> |maintained by| cran
    r_packages --> |isolated by|r_virtual_environments
    r_language --> |allows| parallel_and_multithreaded_functions
    r_language --> |provides for| ml
    r_dev --> |commonly done in| rstudio

    r_interpreter --> |loaded by|r_module
    r_packages --> |loaded by|r_packages_module
    rstudio --> |loaded by|rstudio_module

    rstudio_module --> |automatically loads latest| r_packages_module
    r_packages_module --> |automatically loads corresponding version of| r_module
```

## Exercises used in the course

The course uses a so-called tarball files with exercises as
used in this course.

See [How to use the course tarball](../common/use_tarball.md)
how to get and decompress it.

In the 'Load and run R' session, there is the time to do so.
