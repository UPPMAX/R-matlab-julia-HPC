Isolated environments with ``renv``
===================================

.. note::
   Isolated environments solve a couple of problems:
   
   - You can install specific, also older, versions into them.
   - You can create one for each project and no problem if the two projects
     require different versions.
   - You can remove the environment and create a new one, if not needed or with
     errors.
   
R is not very well known for virtual environments like Python and Julia. However:

The ``renv`` package is a new effort to bring project-local R dependency management to your projects. 
The goal is for ``renv`` to be a robust, stable replacement for the Packrat package, with fewer surprises and better default behaviors.


.. questions::

   - How to work with isolated R environments at HPC2N, UPPMAX and LUNARC?
 
.. objectives:: 

   - Give a general introduction to isolated environments in R.
   - Show an example with installing an R package to an isolated renv environment. 

.. admonition:: Goal

   - You will learn how to create a renv and install a package to it. 

General procedures   
------------------

You will now and then have the situation that your project(s) use different versions of R and different versions of packages. This is great if you need different versions of a package for different tasks, for instance. This is easily solved with isolated environments.

Isolated environments lets you create separate workspaces for different versions of R and/or different versions of packages. You can activate and deactivate them one at a time, and work as if the other workspace does not exist.

Underlying the philosophy of ``renv`` is that any of your existing workflows should just work as they did before. 

- ``renv`` helps manage library paths (and other project-specific state) to help isolate your project’s R dependencies
- the existing tools you’ve used for managing R packages (e.g. ``install.packages()``, ``remove.packages()``) should work as they did before. 
- [Introduction to renv](https://rstudio.github.io/renv/articles/renv.html)

Workflow
--------

The general workflow when working with ``renv`` is:

    1. Call ``renv::init()`` from inside ``R`` to initialize a new project-local environment with a private R library,

    2. Work in the project as normal, installing and removing new R packages as they are needed in the project,

    3. Call ``renv::snapshot()`` to save the state of the project library to the lockfile (called ``renv.lock``),

    4. Continue working on your project, installing and updating R packages as needed.

    5. Call ``renv::snapshot()`` again to save the state of your project library if your attempts to update R packages were successful, or call ``renv::restore()`` to revert to the previous state as encoded in the lockfile if your attempts to update packages introduced some new problems.

The ``renv::init()`` function attempts to ensure the newly-created project library includes all R packages currently used by the project. It does this by crawling R files within the project for dependencies with the ``renv::dependencies()`` function. The discovered packages are then installed into the project library with the ``renv::hydrate()`` function, which will also attempt to save time by copying packages from your user library (rather than reinstalling from CRAN) as appropriate.

Calling ``renv::init()`` will also write out the infrastructure necessary to automatically load and use the private library for new R sessions launched from the project root directory. This is accomplished by creating (or amending) a project-local ``.Rprofile`` with the necessary code to load the project when the R session is started.

If you’d like to initialize a project without attempting dependency discovery and installation – that is, you’d prefer to manually install the packages your project requires on your own – you can use ``renv::init(bare = TRUE)`` to initialize a project with an empty project library.

Example - Creating a renv and installing ``knitr``
**************************************************

.. type-along::

   - First create a project under the course project directory (Kebnekaise and Rackham) or in your home directory (Cosmos) and cd to it

   .. tabs::

      .. tab:: UPPMAX

         .. code-block:: console
   
            $ mkdir -v /proj/r-py-jl-m-rackham/<your-dir>/r_proj && cd $_    

      .. tab:: HPC2N
 
         .. code-block:: console
   
            $ mkdir -v /proj/nobackup/r-py-jl-m/<your-dir>/r_proj && cd $_

      .. tab:: LUNARC 

         .. code-block:: console

            $ mkdir -v $HOME/r_proj && cd $_ 

   - Make sure you have loaded ``R`` and ``R_packages`` on UPPMAX or ``R`` and ``R-bundle-Bioconductor (and possibly R-bundle-CRAN if you use one of the newest versions of R)`` on HPC2N and ``R`` on LUNARC. 

   .. tabs::

      .. tab:: UPPMAX

         .. code-block:: console

            $ ml R/4.1.1 R_packages/4.1.1

      .. tab:: HPC2N

         .. code-block:: console

            $ ml GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1 R-bundle-Bioconductor/3.15-R-4.2.1 

      .. tab:: LUNARC 

         .. code-block:: console 

            $ ml GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1 

   - Next, launch the ``R`` interpreter and initialize a ``renv`` environment.

     .. code-block:: R
   
        > renv::init()
      
   - Exit the session
   
     .. code-block:: R

        > quit()

   - Verify that the ``renv`` directory as well as lock file was created

     .. code-block:: console

        $ ls -l
        drwxrwsr-x 4 matpiq p_py-r-jl 4096 Feb  9 16:32 renv
        -rw-rw-r-- 1 matpiq p_py-r-jl  354 Feb  9 16:32 renv.lock

   - Relaunch R and check the library paths

     .. code-block:: Rconsole

        > .libPaths()
        [1] "/crex/proj/py-r-jl/matpiq/r_proj/renv/library/R-4.1/x86_64-pc-linux-gnu"
        [2] "/scratch/RtmpMgprgX/renv-system-library"

   **Question**: What happens if you leave the project directory? 

   As a last step we can try installing some package into the environment. Let's re-enter the project directory (if you left it) and try installing  ``knitr``. Start R again if you had exited it. 

   .. code-block:: rconsole

      > install.packages("knitr")

   You could exit R and check what was installed 

   .. code-block:: console

      $ ls -l renv/library/R-4.1/x86_64-pc-linux-gnu
      lrwxrwxrwx  1 matpiq p_py-r-jl  121 Feb  9 16:44 evaluate -> /domus/h1/matpiq/.cache/R/renv/cache/v5/R-4.1/x86_64-pc-linux-gnu/evaluate/0.20/4b68aa51edd89a0e044a66e75ae3cc6c/evaluate
      lrwxrwxrwx  1 matpiq p_py-r-jl  115 Feb  9 16:44 highr -> /domus/h1/matpiq/.cache/R/renv/cache/v5/R-4.1/x86_64-pc-linux-gnu/highr/0.10/06230136b2d2b9ba5805e1963fa6e890/highr
      lrwxrwxrwx  1 matpiq p_py-r-jl  115 Feb  9 16:44 knitr -> /domus/h1/matpiq/.cache/R/renv/cache/v5/R-4.1/x86_64-pc-linux-gnu/knitr/1.42/8329a9bcc82943c8069104d4be3ee22d/knitr
      dr-xr-sr-x 10 matpiq sw        4096 Sep  6  2021 renv
      lrwxrwxrwx  1 matpiq p_py-r-jl  113 Feb  9 16:44 xfun -> /domus/h1/matpiq/.cache/R/renv/cache/v5/R-4.1/x86_64-pc-linux-gnu/xfun/0.37/a6860e1400a8fd1ddb6d9b4230cc34ab/xfun
      lrwxrwxrwx  1 matpiq p_py-r-jl  114 Feb  9 16:44 yaml -> /domus/h1/matpiq/.cache/R/renv/cache/v5/R-4.1/x86_64-pc-linux-gnu/yaml/2.3.7/0d0056cc5383fbc240ccd0cb584bf436/yaml


*Note*: Notice that the packages exposed in the ``renv`` library are actually just symbolic links to the home directory. This allows the same package to be shared across environments. However, having this cached in the home directory might be suboptimal because of limited storage. We can change this behavior by setting ``use.cache:: FALSE`` in the ``renv/settings.dcf`` file. Another option is to set the ``RENV_PATHS_CACHE`` to someplace else, for example ``R_LIBS_SITE`` if the R_packages module is loaded. See more here: https://rstudio.github.io/renv/articles/renv.html#cache.

*Note*: You can also do all of this directly through Rstudio when initializing a project.

.. note::

   To access the packages installed in the renv, you either need to activate it or be in that directory. Load the R module and prerequisites (and possibly R_packages on UPPMAX and R-bundle-Bioconductor / R-bundle-CRAN on HPC2N) and do: 

   - ``renv::load("<path-to-your-renv>")`` inside your R script to access the packages installed in it. Or run from inside your renv directory. 

.. exercise:: Installing "datarium"

   We will need this for an exercise in the "ML with R" section (only on Cosmos and Kebnekaise - Rackham has the library included already). 

   - First create a new project under the course project directory (Kebnekaise and Rackham) or in your home directory (Cosmos) and cd to it. 

   - Then make sure you have loaded the modules: 
    
      - Kebnekaise/Cosmos: R/4.2.1 and prerequsites + R-bundle-Bioconductor/3.15-R-4.2.1 
      - Rackham: R/4.1.1 R_packages/4.1.1 

   - Launch the R interpreter and initialize a renv environment.

   - Install the package "datarium" 

.. solution:: 
   :class: dropdown 

       1. Create a project directory and change to it: 

       .. code-block::

          $ mkdir -v <path-to-your-dir>/r_proj_dat && cd $_      
   
       2. Load R, prerequisites, and other needed modules 

       .. tabs:: 

          .. tab:: Rackham 
             
             .. code-block::

                ml R/4.1.1 R_packages/4.1.1             
         
          .. tab:: Kebnekaise 

             .. code-block:: 

                ml GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1 R-bundle-Bioconductor/3.15-R-4.2.1

          .. tab:: Cosmos

             .. code-block:: 

                ml GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1 R-bundle-Bioconductor/3.15-R-4.2.1

       3. Launch the R interpreter and initialize a renv environment.

       .. code-block:: 

          $ R

       .. code-block::

          > renv::init()

       4. Install "datarium" 

       .. code-block:: 

          install.packages("datarium") 

       5. Save it

       .. code-block::

          renv::snapshot()

       6. Try loading it with 

       .. code-block:: 

          > library(datarium) 

       NOTE: Later, when you need it, for instance in a batch script, you can either  

       - work from inside the r_proj directory 
       - Load the renv with: ``renv::load("<path-to-your-renv>")``


Conda (UPPMAX)
--------------

Another possibility on UPPMAX is instead using Conda to create a virtual environment. For example, create an environment ``yaml`` file. Let's call it ``r_env.yaml``

.. code-block:: yaml

   name: my_r_env
   channels:
    - conda-forge
   dependencies:
    - r
    - r-essentials

Then load conda and create the environment

.. code-block:: console

   $ module load conda
   $ conda env create -f r_env.yaml

Next, we can activate the environment and verify that we have indeed have an
isolated R environment

.. code-block:: console

   $ source activate r_env
   $ which R
   ~/.conda/envs/my_r_env/bin/R

If we want to store our environments somewhere else, e.g. in the project directory (recommended), we can define the environmental variable
``CONDA_ENVS_PATH="path/to/your/env"``.

Benefits of using Conda:

- Easy to install a specific R version (Not bound to module system)
- Good integration with Jupyter
- Should be familiar to people with a Python background


.. keypoints::

   - With a virtual environment you can tailor an environment with specific versions for R and packages, not interfering with other installed versions.
   - Make it for each project you have for reproducibility.
   - UPPMAX and LUNARC have Conda as an alternative to ``renv``
