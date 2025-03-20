Load and run R
==============

.. tabs::

   .. tab:: Learning objectives

      - Practice using the documentation of your HPC cluster
      - Load an R module
      - Start the R interpreter
      - Run an R script
      - Download and extract the exercise files
      - (optional) Find the different R modules
      - (optional) See the list of installed R packages

   .. tab:: For teachers

      Teaching goals are:

      - Learners have practiced using the documentation of their HPC clusters
      - Learners have loaded the module to be able to run R
      - Learners have run the R interpreter
      - Learners have run an R script from the command-line
      - Learners have downloaded and extracted the exercise files
      - (optional) Learners have found the different R modules
      - (optional) Learners have seen the list of installed R packages

      Prior:

      - You want to write and run R code on an HPC cluster
        Which ways do you know?
      - How to start R on an HPC cluster?
      - What is a module system?
      - Why is there a module system?

Introduction
------------

You want to run R on an HPC cluster.
For this, you'll need to read the documentation
of your HPC cluster.

In this session, we will use the documentation of your HPC cluster
to start R.

.. warning::

    Only do lightweight things!

    We are still on the login node, which is shared with many other users.
    This means, that if we do heavy calculations, all the other users
    are affected.

    How to do heavy calculations will be shown in this course later.

Exercises
---------

.. admonition:: Prefer this session as video?
    :class: dropdown

    +------------+-----------------------------------------------------------------------------------+
    | HPC cluster| Location                                                                          |
    +============+===================================================================================+
    | COSMOS     | `Here <https://youtu.be/opRmSCYIeGQ>`_                                            |
    +------------+-----------------------------------------------------------------------------------+
    | Dardel     | `Here <https://nu.nl>`_                                                           |
    +------------+-----------------------------------------------------------------------------------+
    | Kebnekaise | `Here <https://youtu.be/3FHvyaPsAXU>`_                                            |
    +------------+-----------------------------------------------------------------------------------+
    | Rackham    | `Here <https://youtu.be/rkahZzZxfuI>`_                                            |
    +------------+-----------------------------------------------------------------------------------+
    | Tetralith  | `Here <https://nu.nl/>`_                                                          |
    +------------+-----------------------------------------------------------------------------------+

Exercise 1: start the R interpreter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Find the documentation of your HPC cluster

.. admonition:: Answer
    :class: dropdown

    +------------+-----------------------------------------------------------------------------------+
    | HPC cluster| Location                                                                          |
    +============+===================================================================================+
    | COSMOS     | `Here <https://lunarc-documentation.readthedocs.io/en/latest/>`_                  |
    +------------+-----------------------------------------------------------------------------------+
    | Dardel     | `Here <https://support.pdc.kth.se/doc/support/>`_                                 |
    +------------+-----------------------------------------------------------------------------------+
    | Kebnekaise | `Here <https://docs.hpc2n.umu.se/>`_                                              |
    +------------+-----------------------------------------------------------------------------------+
    | Rackham    | `Here <http://docs.uppmax.uu.se/>`_                                               |
    +------------+-----------------------------------------------------------------------------------+
    | Tetralith  | `Here <https://www.nsc.liu.se/support/systems/tetralith-getting-started/>`_       |
    +------------+-----------------------------------------------------------------------------------+

- Within the documentation of your HPC cluster, search for the documentation about R

.. admonition:: Answer
    :class: dropdown

    +------------+----------------------------------------------------------------------------------------------------------------+
    | HPC cluster| Page name and location                                                                                         |
    +============+================================================================================================================+
    | COSMOS     | `R Software environment <https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Rscript/>`_ |
    +------------+----------------------------------------------------------------------------------------------------------------+
    | Dardel     | `R <https://support.pdc.kth.se/doc/applications/?sub=r/>`_                                                     |
    +------------+----------------------------------------------------------------------------------------------------------------+
    | Kebnekaise | `R <https://www.hpc2n.umu.se/resources/software/r>`_                                                           |
    +------------+----------------------------------------------------------------------------------------------------------------+
    | Rackham    | `R <https://docs.uppmax.uu.se/software/r/>`_                                                                   |
    +------------+----------------------------------------------------------------------------------------------------------------+
    | Tetralith  | `R <https://www.nsc.liu.se/software/catalogue/tetralith/modules/r.html>`_                                      |
    +------------+----------------------------------------------------------------------------------------------------------------+

- From the terminal, load the module(s) for R,
  of the recommend version as shown below

+----------+---------+
|HPC center|R version|
+==========+=========+
|COSMOS    |4.2.1    |
+----------+---------+
|Dardel    |4.1.1    |
+----------+---------+
|Kebnekaise|4.1.2    |
+----------+---------+
|Rackham   |4.1.1    |
+----------+---------+
|Tetralith |4.2.2    |
+----------+---------+

.. admonition:: Answer
    :class: dropdown

    +------------+----------------------------------------------------------------------------------------------------------------+
    | HPC cluster| How to load the module(s) for R                                                                                |
    +============+================================================================================================================+
    | COSMOS     | :code:`module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1`                                                           |
    +------------+----------------------------------------------------------------------------------------------------------------+
    | Dardel     | :code:`module load PDC/23.12 R/4.1.1`                                                                          |
    +------------+----------------------------------------------------------------------------------------------------------------+
    | Kebnekaise | :code:`module load GCC/11.2.0 OpenMPI/4.1.1 R/4.1.2`                                                           |
    +------------+----------------------------------------------------------------------------------------------------------------+
    | Rackham    | :code:`module load R/4.1.1`                                                                                    |
    +------------+----------------------------------------------------------------------------------------------------------------+
    | Tetralith  | :code:`module load R/4.2.2-hpc1-gcc-11.3.0-bare`                                                               |
    +------------+----------------------------------------------------------------------------------------------------------------+

- From the terminal, start the R interpreter

.. admonition:: Answer
    :class: dropdown

    +------------+----------------------------------+
    | HPC cluster| How to start the R interpreter   |
    +============+==================================+
    | COSMOS     | :code:`R`                        |
    +------------+----------------------------------+
    | Dardel     | :code:`R`                        |
    +------------+----------------------------------+
    | Kebnekaise | :code:`R`                        |
    +------------+----------------------------------+
    | Rackham    | :code:`R`                        |
    +------------+----------------------------------+
    | Tetralith  | :code:`R`                        |
    +------------+----------------------------------+

- From the R interpreter, run the R code :code:`message("Hello")`
  to verify if this
  makes the R interpreter show the text 'Hello'

- From the R interpreter, run the R code :code:`quit()`
  to quit the R interpreter
  and go back to the terminal


Exercise 2: run an R script
~~~~~~~~~~~~~~~~~~~~~~~~~~~

To run an R script, we'll download one, after which we'll run it:

- From the terminal, run :code:`wget https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/r/hello.R`

- From the terminal, run :code:`Rscript hello.R`

Exercise 3: download and extract the tarbal with exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

See `here <https://uppmax.github.io/R-python-julia-matlab-HPC/common/use_tarball.html>`_
how to download and extract the tarbal with exercises.

Exercise X1: find and use installed R packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- From the R interpreter, check which packages are installed.

.. admonition:: Answer
    :class: dropdown 

    +------------+----------------------------------+
    | HPC cluster| Answe                            |
    +============+==================================+
    | COSMOS     | :code:`installed.packages()`     |
    +------------+----------------------------------+
    | Dardel     | :code:`installed.packages()`     |
    +------------+----------------------------------+
    | Kebnekaise | :code:`installed.packages()`     |
    +------------+----------------------------------+
    | Rackham    | :code:`installed.packages()`     |
    +------------+----------------------------------+
    | Tetralith  | :code:`installed.packages()`     |
    +------------+----------------------------------+

- From the R interpreter, load the ``parallel`` package.

.. admonition:: Answer
    :class: dropdown 

    +------------+----------------------------------+
    | HPC cluster| Answe                            |
    +============+==================================+
    | COSMOS     | :code:`library(parallel)`        |
    +------------+----------------------------------+
    | Dardel     | :code:`library(parallel)`        |
    +------------+----------------------------------+
    | Kebnekaise | :code:`library(parallel)`        |
    +------------+----------------------------------+
    | Rackham    | :code:`library(parallel)`        |
    +------------+----------------------------------+
    | Tetralith  | :code:`library(parallel)`        |
    +------------+----------------------------------+


Exercise X2: search for other R versions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use the module system to find which versions of R are provided
by your cluster's module system.

.. admonition:: Answer
    :class: dropdown

    +------------+----------------------------------+
    | HPC cluster| How to search for the R modules  |
    +============+==================================+
    | COSMOS     | :code:`module spider R`          |
    +------------+----------------------------------+
    | Dardel     | :code:`module spider R`          |
    +------------+----------------------------------+
    | Kebnekaise | :code:`module spider R`          |
    +------------+----------------------------------+
    | Rackham    | :code:`module spider R`          |
    +------------+----------------------------------+
    | Tetralith  | :code:`module spider R`          |
    +------------+----------------------------------+


