# Packages

!!! note "R packages"

    - R packages is the main way of extending the functionality of R and
     **broadens the use of R** to almost infinity! 
    - Instead of writing code yourself there may be others that have done the
     same!
    - Many **scientific tools** are distributed as **R packages**. This makes it possible to just run a script from the prompt. You can define files to be analysed and use arguments to define exactly what to do.
    - For more details about packages and in particular developing your own,
     see: `R packages <https://r-pkgs.org>`_

!!! note "Questions"
   
    - What is an R package?
    - How do I find which packages and versions are available?
    - What to do if I need other packages?
    - Are there differences between HPC2N, UPPMAX, LUNARC, NSC, and PDC?
   
!!! note "Objectives"

    - Check if an R package is installed
    - Load and use R packages 
    - Install R packages yourself


## Package libraries

   In R, a library is a directory containing installed packages, sort of like a library for books. Unfortunately, in the R world, you will frequently encounter confused usage of the words “library” and “package”. It’s common for someone to refer to dplyr, for example, as a library when it is actually a package (Wickham & Hadley, 2023).

We might want to know where the ``R`` interpreter will be searching for packages, i.e. where the libraries are located (could be several). The easiest way to check is probably starting the interpreter and running the ``libPaths()`` function.


=== "NSC"

    Load ``R``, e.g. version 4.2.2 and start the Interpreter 

    ```bash 
    $ ml R/4.2.2-hpc1-gcc-11.3.0-bare
    $ R 
    ``` 

    Then check find the path of the library using the ``libPaths()`` function.

    ```bash 
    > .libPaths()
    [1] "/software/sse2/tetralith_el9/manual/R/4.2.2/g11/hpc1/lib64/R/library"
    ```

=== "PDC"

    Load ``R``, e.g. version 4.4.1 and start the Interpreter 

    ```bash 
    $ ml PDC/23.12 R/4.4.1-cpeGNU-23.12 
    $ R 
    ```

    Then check find the path of the library using the ``libPaths()`` function. 

    ```R 
    > .libPaths()
    [1] "/cfs/klemming/home/b/bbrydsoe/.R/23.12/4.4.1/library"                  
    [2] "/cfs/klemming/pdc/software/dardel/23.12/eb/software/R/4.4.1-cpeGNU-23.12/lib64/R/library"
    > 
    ```

=== "UPPMAX"

    Load ``R``, e.g. version 4.1.1 and start the Interpreter

    ```bash 
    $ ml R/4.1.1
    $ R
    ```

    Then check find the path of the library using the ``libPaths()`` function.

    ```R
    > .libPaths()
    [1] "/sw/apps/R/4.1.1/rackham/lib64/R/library"
    ```
	
=== "HPC2N"
   
    Load ``R``, e.g. version 4.1.2 and start the Interpreter

    ```bash
    $ ml GCC/11.2.0  OpenMPI/4.1.1  R/4.1.2
    $ R
    ```

    Then check find the path of the library using the ``libPaths()`` function.

    ```R
    > .libPaths()
    [1] "/pfs/stor10/users/home/b/bbrydsoe/R-packages-4.1.2"                                     
    [2] "/cvmfs/ebsw.hpc2n.umu.se/amd64_ubuntu2004_bdw/software/R/4.1.2-foss-2021b/lib/R/library"
    ```

=== "LUNARC"
   
    Load ``R``, e.g. version 4.2.1 and start the Interpreter

    ```bash
    $ ml GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1
    $ R
    ```

    Then check find the path of the library using the ``libPaths()`` function.

    ```R
    > .libPaths()
    [1] "/home/bbrydsoe/R-packages-4.2.1"                                     
    [2] "/sw/easybuild_milan/software/R/4.2.1-foss-2022a/lib64/R/library"
    ```

!!! warning "Warning: Modules on Dardel"

    If you are using Dardel, then note that there are 13 pre-loaded modules when you login, most of which are related to the machine being a Cray. If you do ``module purge`` there, they will all be removed together with the application software modules you wanted to purge. This may cause problems. 

    List of modules that are pre-loaded (March 2025) *and* which will be removed with ``module purge``: 

    - craype-x86-rome
    - libfabric/1.20.1
    - craype-network-ofi
    - perftools-base/23.12.0
    - xpmem/2.8.2-1.0_3.9__g84a27a5.shasta
    - cce/17.0.0
    - craype/2.7.30
    - cray-dsmml/0.2.2
    - cray-mpich/8.1.28
    - cray-libsci/23.12.5
    - PrgEnv-cray/8.5.0
    - snic-env/1.0.0

    You may have to reload all of these if you do ``module purge``. The easiest solution is this: 

    - Immediately after logging in, and before loading any modules (assuming you have not added any to ``.bashrc`` do 
      
    ```bash
    module save preload
    ``` 

    - then, when you have done a ``module purge`` to remove some application software modules you have loaded (like R and prerequisites) and want to load a different version perhaps, do 

    ```bash
    module restore preload 
    ```

    That will restore the preloaded modules. 


## Preinstalled package libraries

UPPMAX, HPC2N, LUNARC, NSC, and PDC all offer larger or smaller amounts of preinstalled packages.

!!! note "HPC2N"

    - On HPC2N most of these (around 750 packages) come with the ``R`` module and additional ones in the ``R-bundle-Bioconductor``. However, for the newer versions of R, fewer packages are included with the core R module and the packages on CRAN can be found in the module ``R-bundle-CRAN``. Use ``module spider <module>/<version>`` to check for prerequisites, as usual. 

!!! note "UPPMAX"

    On UPPMAX the module ``R_packages`` is a package library containing almost all packages in the CRAN and BioConductor repositories. As of 2023-10-11 there are a total of:

    - A total of 23476 R packages are installed
    - A total of 23535 packages are available in CRAN and BioConductor
        - 19809 CRAN packages are installed, out of 19976 available
        - 3544 BioConductor-specific packages are installed, out of 3559 available
    - 121 other R packages are installed. These are not in CRAN/BioConductor, are only available in the CRAN/BioConductor archives, or are hosted on github, gitlab or elsewhere

!!! note "LUNARC"

    On LUNARC most of the R packages come with the ``R`` module. 

!!! note "NSC"

    On NSC, a small number of the R packages come with the ``R`` module. You will have to install the rest yourself.  

!!! note "PDC"

    On PDC about 250 packages come with the ``R`` module. 


There are many different ways to check if the package you are after is already installed - chances are it is! The simplest way is probably to simply try loading the package from within ``R`` (you can also get a list of all packages with ``installed.packages()`` but that can be overwhelming): 

```R
library(package-name)
```

To learn about other ways, see the page "More about R packages" under "Extra reading" in the left menu. 


!!! note "Exercise"

    Start R (remember to load a module + prerequisites if you have not already). Check if the packages ``pillar`` and ``caret`` are installed, as shown above. 

=== "UPPMAX"

    !!! note "Solution"

        If you want, you can try loading the libraries inside R without loading the R_packages module and see almost nothing is installed. 

        ```bash 

        $ module load R/4.1.1 
        Nearly all CRAN and BioConductor packages are installed and available by
        loading the module R_packages/4.1.1
        $ module load R_packages/4.1.1
        R_packages/4.1.1: The RStudio packages pane is disabled when loading this module, due to performance issues. All packages are still available.
        R_packages/4.1.1: For more information and instructions to re-enable it, see 'module help R_packages/4.1.1'
            
        $ R
            
        R version 4.1.1 (2021-08-10) -- "Kick Things"
        Copyright (C) 2021 The R Foundation for Statistical Computing
        Platform: x86_64-pc-linux-gnu (64-bit)

        R is free software and comes with ABSOLUTELY NO WARRANTY.
        You are welcome to redistribute it under certain conditions.
        Type 'license()' or 'licence()' for distribution details.

          Natural language support but running in an English locale

        R is a collaborative project with many contributors.
        Type 'contributors()' for more information and
        'citation()' on how to cite R or R packages in publications.

        Type 'demo()' for some demos, 'help()' for on-line help, or
        'help.start()' for an HTML browser interface to help.
        Type 'q()' to quit R.

        > library(pillar)
        > library(caret)
        Loading required package: ggplot2
        Loading required package: lattice
        >   
        ```

=== "HPC2N"
       
    !!! note "Solution"

        ```bash
        $ module load GCC/11.2.0  OpenMPI/4.1.1 R/4.1.2
        $ R
        R version 4.1.2 (2021-11-01) -- "Bird Hippie"
        Copyright (C) 2021 The R Foundation for Statistical Computing
        Platform: x86_64-pc-linux-gnu (64-bit)

        R is free software and comes with ABSOLUTELY NO WARRANTY.
        You are welcome to redistribute it under certain conditions.
        Type 'license()' or 'licence()' for distribution details.

          Natural language support but running in an English locale

        R is a collaborative project with many contributors.
        Type 'contributors()' for more information and
        'citation()' on how to cite R or R packages in publications.

        Type 'demo()' for some demos, 'help()' for on-line help, or
        'help.start()' for an HTML browser interface to help.
        Type 'q()' to quit R.

        [Previously saved workspace restored]

        > library(pillar)
        > library(caret)
        Loading required package: ggplot2
        Loading required package: lattice
        >
        ```

=== "LUNARC"

    !!! note "Solution" 

        ```bash 
        $ module load GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1
        $ R

        R version 4.2.1 (2022-06-23) -- "Funny-Looking Kid"
        Copyright (C) 2022 The R Foundation for Statistical Computing
        Platform: x86_64-pc-linux-gnu (64-bit)

        R is free software and comes with ABSOLUTELY NO WARRANTY.
        You are welcome to redistribute it under certain conditions.
        Type 'license()' or 'licence()' for distribution details.

          Natural language support but running in an English locale

        R is a collaborative project with many contributors.
        Type 'contributors()' for more information and
        'citation()' on how to cite R or R packages in publications.
 
        Type 'demo()' for some demos, 'help()' for on-line help, or
        'help.start()' for an HTML browser interface to help.
        Type 'q()' to quit R.

        > library(pillar)
        > library(caret)
        Loading required package: ggplot2
        Loading required package: lattice
        > 
        ```

=== "NSC"
   
    !!! note "Solution" 
 
        ```bash
        $ ml R/4.2.2-hpc1-gcc-11.3.0-bare
        $ R 

        R version 4.2.2 (2022-10-31) -- "Innocent and Trusting"
        Copyright (C) 2022 The R Foundation for Statistical Computing
        Platform: x86_64-pc-linux-gnu (64-bit)

        R is free software and comes with ABSOLUTELY NO WARRANTY.
        You are welcome to redistribute it under certain conditions.
        Type 'license()' or 'licence()' for distribution details.

        R is a collaborative project with many contributors.
        Type 'contributors()' for more information and
        'citation()' on how to cite R or R packages in publications.

        Type 'demo()' for some demos, 'help()' for on-line help, or
        'help.start()' for an HTML browser interface to help.
        Type 'q()' to quit R.
             
        > library(pillar)
        Error in library(pillar) : there is no package called ‘pillar’
        > library(caret)
        Error in library(caret) : there is no package called ‘caret’
        > 
        ```
             
=== "PDC"

    !!! note Solution" 

        ```bash
        $ ml PDC/23.12 R/4.4.1-cpeGNU-23.12 
        $ R 

        R version 4.4.1 (2024-06-14) -- "Race for Your Life"
        Copyright (C) 2024 The R Foundation for Statistical Computing
        Platform: x86_64-suse-linux-gnu

        R is free software and comes with ABSOLUTELY NO WARRANTY.
        You are welcome to redistribute it under certain conditions.
        Type 'license()' or 'licence()' for distribution details.

          Natural language support but running in an English locale

        R is a collaborative project with many contributors.
        Type 'contributors()' for more information and
        'citation()' on how to cite R or R packages in publications.

        Type 'demo()' for some demos, 'help()' for on-line help, or
        'help.start()' for an HTML browser interface to help.
        Type 'q()' to quit R. 

        > library(pillar)
        > library(caret)
        Error in library(caret) : there is no package called ‘caret’
        >
        ```
         
## Installing your own packages

Sometimes you will need R packages that are not already installed. The solution
to this is to install your own packages. These packages will usually come from
CRAN (https://cran.r-project.org/) - the Comprehensive R Archive Network, or
sometimes from other places, like GitHub or R-Forge

Here we will look at installing R packages with automatic download and with
manual download. It is also possible to install from inside Rstudio. 

### Setup

We need to create a place for the own-installed packages to be and to tell R
where to find them. The initial setup only needs to be done once, but separate
package directories need to be created for each R version used. 

R reads the ``$HOME/.Renviron`` file to setup its environment. It should be
created by R on first run, or you can create it with the command: ``touch
$HOME/.Renviron``

**NOTE**: In this example we are going to assume you have chosen to place the R packages in a directory under your home directory, but in general it might be good to use the project storage for space reasons. As mentioned, you will need
separate ones for each R version.

If you have not yet installed any packages to R yourself, the environment file should be empty and you can update it like this: 

```bash 
$ echo R_LIBS_USER="$HOME/R-packages-%V" > ~/.Renviron
```

!!! warning

    - If it is **not empty**, you can edit ``$HOME/.Renviron`` with your favorite editor so that ``R_LIBS_USER`` contains the path to your chosen directory for own-installed R packages. 


It should look something like this when you are done:

```bash 
$ R_LIBS_USER="/home/u/user/R-packages-%V"
```

**NOTE** Replace ``/home/u/user`` with the value of ``$HOME``. Run ``echo $HOME`` to see its value.

**NOTE** The ``%V`` should be written as-is, it's substituted at runtime with the active R version.

**NOTE** At Dardel (NSC) the path is ``/cfs/klemming/home/u/user`` but you can see it with ``echo $HOME``. 

For each version of R you are using, create a directory matching the pattern
used in ``.Renviron`` to store your packages in. This example is shown for R
version 4.1.1:

```bash
$ mkdir -p $HOME/R-packages-4.1.1
```

!!! note

    If you will be installing many R packages yourself, it is a good idea to place them in your project storage instead, as they can take up a lot of space and your home directory is not very large.

    In that case you would instead do the setup as: 

    ```bash
    $ echo R_LIBS_USER="<path-to-your-space-on-proj-storage>/R-packages-%V" > ~/.Renviron
    ```

    And then create directories for each R version you use there, like this, for R/4.1.1

    ```bash
    mkdir -p <path-to-your-space-on-proj-storage>/R-packages-4.1.1
    ```


### Automatical download and install from CRAN

!!! note 

    You find a list of packages in CRAN (https://cran.r-project.org/) and a list of repos here: https://cran.r-project.org/mirrors.html 

    Please choose a location close to you when picking a repo. 


=== "From command line"

    ```bash
    $ R --quiet --no-save --no-restore -e "install.packages('<r-package>', repos='<repo>')"
    ```
    
=== "From inside R"

    ```R
    install.packages('<r-package>', repos='<repo>')
    ```       

In either case, the dependencies of the package will be downloaded and
installed as well. 

      
#### Example

In this example, we will install the R package ``nuggets`` and use the
repository http://ftp.acc.umu.se/mirror/CRAN/ 

**Note**: You need to load R (and any prerequisites, and possibly R-bundle-Bioconductor if you need packages from that) before installing packages. 

=== "From command line"

    ```bash
    $ R --quiet --no-save --no-restore -e "install.packages('nuggets', repos='http://ftp.acc.umu.se/mirror/CRAN/')"
    ```
       
=== "From inside R"

    ```R
    install.packages('nuggets', repos='http://ftp.acc.umu.se/mirror/CRAN/')
    ```

!!! important "Solution for installing nuggets" 

    1)

    - UPPMAX: ``module load R_packages/4.1.1``
    - HPC2N: ``module load GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1``
    - LUNARC: ``module load GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1``
    - NSC: ``module load R/4.2.2-hpc1-gcc-11.3.0-bare`` 
    - PDC: ``module load PDC/23.12 R/4.4.1-cpeGNU-23.12`` 

    2)

    - ``echo R_LIBS_USER="$HOME/R-packages-%V" > ~/.Renviron``

    OR (option if UPPMAX, HPC2N, NSC, or PDC)

    - UPPMAX: ``echo R_LIBS_USER="/proj/r-matlab-julia-uppmax/<yourdir>/R-packages-%V" > ~/.Renviron``
    - HPC2N: ``echo R_LIBS_USER="/proj/nobackup/r-matlab-julia/<yourdir>/R-packages-%V" > ~/.Renviron``
    - NSC: ``echo R_LIBS_USER="/proj/r-matlab-julia-naiss/<yourdir>/R-packages-%V" > ~/.Renviron``
    - PDC: ``echo R_LIBS_USER="/cfs/klemming/projects/snic/r-matlab-julia-naiss/<yourdir>/R-packages-%V" > ~/.Renviron``

    3) Create directory for R packages:

    - LUNARC: ``mkdir -p $HOME/R-packages-4.2.1``
    - UPPMAX:
        - ``mkdir -p $HOME/R-packages-4.1.1``
        - OR ``mkdir -p /proj/r-py-jl-m-rackham/<yourdir>/R-packages-4.1.1``
    - HPC2N:
        - ``mkdir -p $HOME/R-packages-4.2.1``
        - OR ``mkdir -p /proj/nobackup/r-py-jl-m/<yourdir>/R-packages-4.2.1``
    - NSC: 
        - ``mkdir -p $HOME/R-packages-4.2.2``
        - OR ``mkdir -p /proj/r-matlab-julia-naiss/users/<yourdir>/R-packages-4.2.2``
    - PDC: 
        - ``mkdir -p $HOME/R-packages-4.4.1``
        - OR ``mkdir -p /cfs/klemming/projects/snic/r-matlab-julia-naiss/<yourdir>/R-packages-4.4.1```

    4) Either of

    - Start R and install: ``install.packages('nuggets', repos='http://ftp.acc.umu.se/mirror/CRAN/')``
    - Install from command line: ``R --quiet --no-save --no-restore -e "install.packages('nuggets', repos='http://ftp.acc.umu.se/mirror/CRAN/')"``


For other ways to install R packages, including from GitHub or manually, look at the "More about R packages" from the "Extra reading" section in the bottom left side of the menu. 

!!! note 

    Places to look for R packages
   
    - CRAN (https://cran.r-project.org/)
    - R-Forge (https://r-forge.r-project.org/)
    - Project's own GitHub page
    - etc.
   

!!! note "Keypoints"

    - You can check for installed packages 
        - from inside R with ``installed.packages()``
	- from BASH shell with the 
	    - ``ml help R/<version>`` at UPPMAX
	    - ``ml spider R/<version>`` at HPC2N
            - ``ml spider R/<version>`` at LUNARC 
            - ``ml spider R/version>`` at NSC
            - ``ml spider R/version> at PDC``
    - Installation of R packages can be done either from within R or from the
     command line (BASH shell)
    - CRAN is the recommended place to look for R-packages, but many packages can be found on GitHub and if you want the development version of a package you likely need to get it from GitHub or other place outside CRAN. You would then either download and install manually or install with something like devtools, from within R. 

#### Extra example, NSC

For NSC you need to install ``doParallel`` and ``foreach``, and ``pbdMPI`` (since ``Rmpi`` does not work) yourself to do the exercises in the section about batch. You can either do that now, exactly the same way a above for ``nuggets`` or you do it later today, during the batch session. 

- If you have the setup done, and R loaded, then: 
    - Start R
    - Then ``install.packages('foreach', repos='http://ftp.acc.umu.se/mirror/CRAN/')``  
    - and ``install.packages('doParallel', repos='http://ftp.acc.umu.se/mirror/CRAN/')``
    - and ``install.packages('pbdMPI', repos='http://ftp.acc.umu.se/mirror/CRAN/')``


#### Extra example, PDC

For PDC the package ``Rmpi`` does not work correctly, so we will instead use the package ``pbdMPI``, which you need to install yourself to one of the exercises in the section about batch. You can either do that now, or you do it later today, during the batch session.

- If you have the setup done, and the R module loaded, then (on the command line, not inside R):
    - First copy the tarball: ``cp /cfs/klemming/projects/snic/r-matlab-julia-naiss/pbdMPI_0.5-2.tar.gz .`` while standing in your own directory that you are running R scripts from.  
    - Then do: ``R CMD INSTALL pbdMPI_0.5-2.tar.gz --configure-args=" --with-mpi-include=/opt/cray/pe/mpich/8.1.28/ofi/gnu/12.3/include --with-mpi-libpath=/opt/cray/pe/mpich/8.1.28/ofi/gnu/12.3/lib --with-mpi-type=MPICH2" --no-test-load``

    
## Install own packages on Bianca

- If an R package is not not available on Bianca already (like Conda repositories) you may have to use the wharf to install the library/package
- Typical workflow
    - Install on Rackham
    - Transfer to Wharf
    - Move package to local Bianca R package path
    - Test your installation
- Demo and exercise from our Bianca course:
    - `Installing R packages on Bianca <https://uppmax.github.io/bianca_workshops/extra/rpackages/>`_


## Exercises

!!! important "Install a package with automatic download"

    1. First do the setup of `.Renviron` and create the directory for installing R packages (Recommended load R version 4.1.1 on Rackham, 4.1.2 on Kebnekaise, 4.2.1 on LUNARC, 4.2.2 on NSC, and 4.4.1 on PDC)
    2. From the command line. Suggestion: ``anomalize``
    3. From inside R. Suggestion: ``BGLR``
    4. Start R and see if the library can be loaded. 
   
    These are both on CRAN, and this way any dependencies will be installed as well. 
   
    Remember to pick a repo that is nearby, to install from: https://cran.r-project.org/mirrors.html 


!!! important "Solution for 4.1.1 on Rackham (change <user>)" 

    Solution is very similar for the other centres - just change the R version (for instance to 4.2.1 for LUNARC and 4.1.2 for HPC2N and 4.2.2 for NSC and 4.4.1 for PDC).  

    === "Setup"
      
        ```bash
        $ echo R_LIBS_USER="$HOME/R-packages-%V" > ~/.Renviron
        $ mkdir -p $HOME/R-packages-4.1.1
        ```	    

    === "Command line"
      
        Installing package "anomalize". Using the repo http://ftp.acc.umu.se/mirror/CRAN/
         
        ```bash
    	$ R --quiet --no-save --no-restore -e "install.packages('anomalize', repo='http://ftp.acc.umu.se/mirror/CRAN/')"
	    ```
  
        This assumes you have already loaded the R module. If not, then do so first. 
	 
    === "Inside R"
      
        Installing package "BGLR". Using the repo http://ftp.acc.umu.se/mirror/CRAN/

        ```R
        > install.packages('BGLR', repo='http://ftp.acc.umu.se/mirror/CRAN/')	     
        ```	     

    === "Load library"

        ```R
        $ R
        > library("anomalize")
        > library("BGLR")
        ``` 
	    
        "BGLR" outputs some text/advertisment when loaded. You can ignore this. 
