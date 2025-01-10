More about R packages
=====================

This page contains some more advanced information about R packages. 

R packages: A short Primer
--------------------------

What is a package, really?
##########################

An R package is essentially a contained folder and file structure containing R
code (and possibly C/C++ or other code) and other files relevant for the
package e.g. documentation(vignettes), licensing and configuration files. Let
us look at a very simple example


.. code-block:: console

   $ git clone https://github.com/MatPiq/R_example.git

   $ cd R_example

   $ tree
   .
   ├── DESCRIPTION
   ├── NAMESPACE
   ├── R
   │   └── hello.R
   ├── man
   │   └── hello.Rd
   └── r_example.Rproj


.. admonition:: Installing tree as non-root on Linux Ubuntu
   :class: dropdown

      If you are on a Linux Ubuntu system where tree is not installed, and you do not have root permissions, you can do this to install it in your own area

      1) Create a directory (in your home folder) to install in:

      .. code-block: console

         mkdir ~/mytree

      Change to that directory:

      .. code-block:: console

         cd ~/mytree

      Now download tree:

      .. code-block:: console

         apt download tree

      Unpack the files:

      .. code-block:: console

         dpkg-deb -xv ./*deb ./

      You can use tree like this now, giving the full path:

      .. code-block:: console

         ~/mytree/usr/bin/tree

      **Note**: if you want to be able to use it with the command "tree" you could set an alias in your ~/.bashrc file and then ``source`` it:

      .. code-block:: console

         echo 'alias tree="$HOME/mytree/usr/bin/tree"' >> ~/.bashrc
         source ~/.bashrc


Package states
##############

An R packages can exist in five possible states

- Source: "source code" or "source files". Development form.
- Bundled: The source code compressed into a single file, usually `tar.gz` and
  sometimes referred to as "source tarballs". Files in `.Rbuildignore` are
  excluded.
- Binary: A compressed and pre-compiled version of a bundle built for a
  specific architecture. Usually how the package is provided by CRAN. Much
  faster than having to compile yourself and no need for dev/build tools.
- Installed: A decompressed binary package located in a package _library_ (more
  on this later).
- In-memory: When the installed package has been loaded from the library into
  memory, using `require(pkg)` or `library(pkg)`.


.. figure:: ../../img/R-pkg-states.png
   :width: 600
   :align: left

.. role:: raw-html(raw)
    :format: html

:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`

| Source:
| https://r-pkgs.org/structure.html and
| https://nbisweden.github.io/RaukR-2021/rpackages_Sebastian/presentation/rpackages_Sebastian.html

Finding out if an R package is installed 
----------------------------------------

There are many different ways to check if the package you are after is already installed - chances are it is! The simplest way is probably to simply try loading the package from within R

``library(package-name)``

Another option would be to create a dataframe of all the installed packages

.. code-block:: R

   ip <- as.data.frame(installed.packages()[,c(1,3:4)])

   rownames(ip) <- NULL

   ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]

   print(ip, row.names=FALSE)

However, this might not be so helpful unless you do additional filtering.
<br>

Another simple option is to ``grep`` the library directory. For example, both when loading ``R_packages`` at UPPMAX and ``R-bundle-Bioconductor`` at HPC2N the environment variable ``R_LIBS_SITE`` will be set to the path of the package
library.

.. tabs::

   .. tab:: UPPMAX

      Load ``R_packages``

      .. code-block:: console

         $ ml R_packages/4.1.1

      Then grep for some package

      .. code-block:: console

         $ ls -l $R_LIBS_SITE | grep glmnet
         dr-xr-sr-x  9 douglas sw  4096 Sep  6  2021 EBglmnet
         dr-xr-sr-x 11 douglas sw  4096 Nov 11  2021 glmnet
         dr-xr-sr-x  8 douglas sw  4096 Sep  7  2021 glmnetcr
         dr-xr-sr-x  7 douglas sw  4096 Sep  7  2021 glmnetUtils

   .. tab:: HPC2N

      Load ``R-bundle-Bioconductor``

      .. code-block:: console

         $ ml GCC/11.2.0  OpenMPI/4.1.1 R-bundle-Bioconductor/3.14-R-4.1.2

      Check the ``R_LIBS_SITE`` environment variable

      .. code-block:: console

         $ echo $R_LIBS_SITE
         /hpc2n/eb/software/R-bundle-Bioconductor/3.14-foss-2021b-R-4.1.2:/hpc2n/eb/software/arrow-R/6.0.0.2-foss-2021b-R-4.1.2

      Then grep for some package in the BioConductor package library

      .. code-block:: console

         $ ls -l /hpc2n/eb/software/R-bundle-Bioconductor/3.14-foss-2021b-R-4.1.2 | grep RNA
         drwxr-xr-x  9 easybuild easybuild 4096 Dec 30  2021 DeconRNASeq/
         drwxr-xr-x  7 easybuild easybuild 4096 Dec 30  2021 RNASeqPower/


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

In this example, we will install the R package ``stringr`` and use the
repository http://ftp.acc.umu.se/mirror/CRAN/

**Note**: You need to load R (and any prerequisites, and possibly R-bundle-Bioconductor if you need packages from that) before installing packages.

.. tabs::

   .. tab:: From command line

      .. code-block:: console

         $ R --quiet --no-save --no-restore -e "install.packages('stringr', repos='http://ftp.acc.umu.se/mirror/CRAN/')"

   .. tab:: From inside R

      .. code-block:: R

          install.packages('stringr', repos='http://ftp.acc.umu.se/mirror/CRAN/')



For other ways to install R packages, including from GitHub, look at the "More about R packages" from the "Extra reading" section in the bottom left side of the menu.

Automatic download and install from GitHub
##########################################

If you want to install a package that is not on CRAN, but which do have a
GitHub page, then there is an automatic way of installing, but you need to
handle prerequsites yourself by installing those first. It can also be that the
package is not in as finished a state as those on CRAN, so be careful.

To install packages from GitHub directly, from inside R, you first need to
install the devtools package. Note that you only need to install this **once**.

This is how you install a package from GitHub, inside R:

 .. code-block:: R
 
    install.packages("devtools")   # ONLY ONCE
    devtools::install_github("DeveloperName/package")
    

Example
*******

.. type-along::

   In this example we want to install the package ``quantstrat``. It is not on CRAN, so let's get it from the GitHub page for the project:
   https://github.com/braverock/quantstrat 

   We also need to install devtools so we can install packages from GitHub. In
   addition, ``quantstrat`` has some prerequisites, some on CRAN, some on GitHub,
   so we need to install those as well. 

   .. code-block:: R 

      install.packages("devtools") # ONLY ONCE
      install.packages("FinancialInstrument") 
      install.packages("PerformanceAnalytics") 
   
      devtools::install_github("braverock/blotter")
      devtools::install_github("braverock/quantstrat")
    
Manual download and install
###########################

If the package is not on CRAN or you want the development version, or you for
other reason want to install a package you downloaded, then this is how to
install from the command line:

.. code-block:: console 

   $ R CMD INSTALL -l <path-to-R-package>/R-package.tar.gz
    

**NOTE** that if you install a package this way, you need to handle any
dependencies yourself.

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


          
