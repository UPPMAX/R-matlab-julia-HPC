Packages
========

.. admonition:: R packages

   - R packages is the main way of extending the functionality of R and
     **broadens the use of R** to almost infinity! 

   - Instead of writing code yourself there may be others that have done the
     same!

   - Many **scientific tools** are distributed as **R packages**. This makes it possible to just run a script from the prompt. You can define files to be analysed and use arguments to define exactly what to do.

   - For more details about packages and in particular developing your own,
     see: `R packages <https://r-pkgs.org>`_

.. questions::
   
   - What is an R package?
   - How do I find which packages and versions are available?
   - What to do if I need other packages?
   - Are there differences between HPC2N, UPPMAX, and LUNARC?
   
.. objectives:: 

   - Check if an R package is installed
   - Load and use R packages 
   - Install R packages yourself


Package libraries
-----------------

    In R, a library is a directory containing installed packages, sort of like
    a library for books. Unfortunately, in the R world, you will frequently
    encounter confused usage of the words “library” and “package”. It’s common
    for someone to refer to dplyr, for example, as a library when it is
    actually a package (Wickham & Hadley, 2023).

We might want to know where the ``R`` interpreter will be searching for
packages, i.e. where the libraries are located (could be several). The easiest
way to check is probably starting the interpreter and running the ``libPaths()`` function.


.. tabs::

   .. tab:: UPPMAX

      Load ``R``, e.g. version 4.1.1 and start the Interpreter

      .. code-block:: console 

         $ ml R/4.1.1
         $ R

      Then check find the path of the library using the ``libPaths()`` function.

      .. code-block:: rconsole
      
         > .libPaths()
         [1] "/sw/apps/R/4.1.1/rackham/lib64/R/library"
	
   .. tab:: HPC2N
   
      Load ``R``, e.g. version 4.1.2 and start the Interpreter

      .. code-block:: console 

         $ ml GCC/11.2.0  OpenMPI/4.1.1  R/4.1.2
         $ R

      Then check find the path of the library using the ``libPaths()`` function.

      .. code-block:: rconsole
      
         > .libPaths()
         [1] "/pfs/stor10/users/home/b/bbrydsoe/R-packages-4.1.2"                                     
         [2] "/cvmfs/ebsw.hpc2n.umu.se/amd64_ubuntu2004_bdw/software/R/4.1.2-foss-2021b/lib/R/library"

   .. tab:: LUNARC
   
      Load ``R``, e.g. version 4.2.1 and start the Interpreter

      .. code-block:: console 

         $ ml GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1
         $ R

      Then check find the path of the library using the ``libPaths()`` function.

      .. code-block:: rconsole
      
         > .libPaths()
         [1] "/home/bbrydsoe/R-packages-4.2.1"                                     
         [2] "/sw/easybuild_milan/software/R/4.2.1-foss-2022a/lib64/R/library"


Preinstalled package libraries
------------------------------

UPPMAX, HPC2N, and LUNARC offer a large amount of preinstalled packages.

.. admonition:: HPC2N

   - On HPC2N most of these (around 750 packages) come with the ``R`` module and additional ones in the ``R-bundle-Bioconductor``. However, for the newer versions of R, the packages on CRAN can be found in the module ``R-bundle-CRAN``. Use ``module spider <module>/<version>`` to check for prerequisites, as usual. 

.. admonition:: UPPMAX

   On UPPMAX the module ``R_packages`` is a package library containing almost all packages in the CRAN and BioConductor repositories. As of 2023-10-11 there are a total of:

   - A total of 23476 R packages are installed
   - A total of 23535 packages are available in CRAN and BioConductor
   
      - 19809 CRAN packages are installed, out of 19976 available
      - 3544 BioConductor-specific packages are installed, out of 3559 available
   - 121 other R packages are installed. These are not in CRAN/BioConductor, are only available in the CRAN/BioConductor archives, or are hosted on github, gitlab or elsewhere

.. admonition:: LUNARC

   On LUNARC most of the R packages come with the ``R`` module. 


There are many different ways to check if the package you are after is already installed - chances are it is! The simplest way is probably to simply try loading the package from within ``R``

.. code-block:: R

   library(package-name)

To learn about other ways, see the page "More about R packages" under "Extra reading" in the left menu. 


.. exercise::

   Start R (remember to load a module + prerequisites if you have not already). Check if the packages ``pillar`` and ``caret`` are installed, as shown above. 

.. tabs::

   .. tab:: UPPMAX

      .. admonition:: Solution

         If you want, you can try loading the libraries inside R without loading the R_packages module and see almost nothing is installed. 

         .. code-block:: console 

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

   .. tab:: HPC2N
       
      .. admonition:: Solution

         .. code-block:: console

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

   .. tab:: LUNARC

      .. admonition:: Solution 

         .. code-block:: console 

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

Installing your own packages
----------------------------

Sometimes you will need R packages that are not already installed. The solution
to this is to install your own packages. These packages will usually come from
CRAN (https://cran.r-project.org/) - the Comprehensive R Archive Network, or
sometimes from other places, like GitHub or R-Forge

Here we will look at installing R packages with automatic download and with
manual download. It is also possible to install from inside Rstudio. 

Setup
#####

We need to create a place for the own-installed packages to be and to tell R
where to find them. The initial setup only needs to be done once, but separate
package directories need to be created for each R version used. 

R reads the ``$HOME/.Renviron`` file to setup its environment. It should be
created by R on first run, or you can create it with the command: ``touch
$HOME/.Renviron``

**NOTE**: In this example we are going to assume you have chosen to place the R packages in a directory under your home directory, but in general it might be good to use the project storage for space reasons. As mentioned, you will need
separate ones for each R version.

If you have not yet installed any packages to R yourself, the environment file should be empty and you can update it like this: 

.. code-block:: console 

   $ echo R_LIBS_USER="$HOME/R-packages-%V" > ~/.Renviron

.. warning::

   - If it is **not empty**, you can edit ``$HOME/.Renviron`` with your favorite editor so that ``R_LIBS_USER`` contains the path to your chosen directory for own-installed R packages. 


It should look something like this when you are done:

.. code-block:: console 

   $ R_LIBS_USER="/home/u/user/R-packages-%V"


**NOTE** Replace ``/home/u/user`` with the value of ``$HOME``. Run ``echo $HOME`` to see its value.
**NOTE** The ``%V`` should be written as-is, it's substituted at runtime with the active R version.

For each version of R you are using, create a directory matching the pattern
used in ``.Renviron`` to store your packages in. This example is shown for R
version 4.1.1:

.. code-block:: sh 

   $ mkdir -p $HOME/R-packages-4.1.1

.. note::

   If you will be installing many R packages yourself, it is a good idea to place them in your project storage instead, as they can take up a lot of space and your home directory is not very large.

   In that case you would instead do the setup as: 

   .. code-block:: console

      $ echo R_LIBS_USER="<path-to-your-space-on-proj-storage>/R-packages-%V" > ~/.Renviron

   And then create directories for each R version you use there, like this, for R/4.1.1

   .. code-block:: console

      mkdir -p <path-to-your-space-on-proj-storage>/R-packages-4.1.1


Automatical download and install from CRAN
##########################################

.. note:: 

    You find a list of packages in CRAN (https://cran.r-project.org/) and a list of repos here: https://cran.r-project.org/mirrors.html 

    Please choose a location close to you when picking a repo. 


.. tabs::

   .. tab:: From command line

      .. code-block:: console 

         $ R --quiet --no-save --no-restore -e "install.packages('<r-package>', repos='<repo>')"
    
   .. tab:: From inside R

      .. code-block:: R 

          install.packages('<r-package>', repos='<repo>')
       

In either case, the dependencies of the package will be downloaded and
installed as well. 

      
Example
*******

In this example, we will install the R package ``nuggets`` and use the
repository http://ftp.acc.umu.se/mirror/CRAN/ 

**Note**: You need to load R (and any prerequisites, and possibly R-bundle-Bioconductor if you need packages from that) before installing packages. 

.. tabs::

   .. tab:: From command line

      .. code-block:: console 

         $ R --quiet --no-save --no-restore -e "install.packages('nuggets', repos='http://ftp.acc.umu.se/mirror/CRAN/')"
       
   .. tab:: From inside R

      .. code-block:: R 

          install.packages('nuggets', repos='http://ftp.acc.umu.se/mirror/CRAN/')


.. solution:: Solution for installing nuggets 

   1)

   - UPPMAX: ``module load R_packages/4.1.1``
   - HPC2N: ``module load GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1``
   - LUNARC: ``module load GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1``

   2)

   - ``echo R_LIBS_USER="$HOME/R-packages-%V" > ~/.Renviron``

   OR (option if UPPMAX or HPC2N)

   - UPPMAX: ``echo R_LIBS_USER="/proj/r-py-jl-m-rackham/<yourdir>/R-packages-%V" > ~/.Renviron``
   - HPC2N: ``echo R_LIBS_USER="/proj/nobackup/r-py-jl-m/<yourdir>/R-packages-%V" > ~/.Renviron``

   3) Create directory for R packages:

   - LUNARC: ``mkdir -p $HOME/R-packages-4.2.1``
   - UPPMAX:
       - ``mkdir -p $HOME/R-packages-4.1.1``
       - OR ``mkdir -p /proj/r-py-jl-m-rackham/<yourdir>/R-packages-4.1.1``
   - HPC2N:
       - ``mkdir -p $HOME/R-packages-4.2.1``
       - OR ``mkdir -p /proj/nobackup/r-py-jl-m/<yourdir>/R-packages/4.2.1``

   4) Either of

   - Start R and install: ``install.packages('nuggets', repos='http://ftp.acc.umu.se/mirror/CRAN/')``
   - Install from command line: ``R --quiet --no-save --no-restore -e "install.packages('nuggets', repos='http://ftp.acc.umu.se/mirror/CRAN/')"``


For other ways to install R packages, including from GitHub or manually, look at the "More about R packages" from the "Extra reading" section in the bottom left side of the menu. 

.. note:: 

   Places to look for R packages
   
   - CRAN (https://cran.r-project.org/)
   - R-Forge (https://r-forge.r-project.org/)
   - Project's own GitHub page
   - etc.
   

.. keypoints::

   - You can check for installed packages 
   	- from inside R with ``installed.packages()``
	- from BASH shell with the 
		- ``ml help R/<version>`` at UPPMAX
		- ``ml spider R/<version>`` at HPC2N
                - ``ml spider R/<version>`` at LUNARC 
   - Installation of R packages can be done either from within R or from the
     command line (BASH shell)
   - CRAN is the recommended place to look for R-packages, but many packages
     can be found on GitHub and if you want the development version of a
     package you likely need to get it from GitHub or other place outside CRAN.
     You would then either download and install manually or install with
     something like devtools, from within R. 

Install own packages on Bianca
------------------------------

- If an R package is not not available on Bianca already (like Conda repositories) you may have to use the wharf to install the library/package
- Typical workflow

   - Install on Rackham
   - Transfer to Wharf
   - Move package to local Bianca R package path
   - Test your installation
- Demo and exercise from our Bianca course:
   - `Installing R packages on Bianca <https://uppmax.github.io/bianca_workshop/extra/rpackages/>`_


Exercises
---------

.. challenge:: Install a package with automatic download

   1. First do the setup of `.Renviron` and create the directory for installing R packages (Recommended load R version 4.1.1 on Rackham, 4.1.2 on Kebnekaise, and 4.2.1 on LUNARC)
   2. From the command line. Suggestion: ``anomalize``
   3. From inside R. Suggestion: ``BGLR``
   4. Start R and see if the library can be loaded. 
   
   These are both on CRAN, and this way any dependencies will be installed as well. 
   
   Remember to pick a repo that is nearby, to install from: https://cran.r-project.org/mirrors.html 


.. solution:: Solution for 4.1.1 on Rackham (change <user>) 

   Solution is very similar for the other centres - just change the R version (for instance to R/4.2.1 for LUNARC and R/4.1.2 for HPC2N).  

   .. tabs:: 

      .. tab:: Setup
      
            .. code-block:: console
	 
               $ echo R_LIBS_USER="$HOME/R-packages-%V" > ~/.Renviron
	       $ mkdir -p $HOME/R-packages-4.1.1
	    

      .. tab:: Command line
      
            Installing package "anomalize". Using the repo http://ftp.acc.umu.se/mirror/CRAN/
         
            .. code-block:: console
	 
	       $ R --quiet --no-save --no-restore -e "install.packages('anomalize', repo='http://ftp.acc.umu.se/mirror/CRAN/')"
	  
            This assumes you have already loaded the R module. If not, then do so first. 
	 
      .. tab:: Inside R
      
            Installing package "BGLR". Using the repo http://ftp.acc.umu.se/mirror/CRAN/

            .. code-block:: R 

               > install.packages('BGLR', repo='http://ftp.acc.umu.se/mirror/CRAN/')	     
	     
      .. tab:: Load library

            .. code-block:: R
	 
	       $ R
	       > library("anomalize")
	       > library("BGLR")
	    
	   "BGLR" outputs some text/advertisment when loaded. You can ignore this. 
