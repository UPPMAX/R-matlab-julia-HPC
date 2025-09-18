Packages at Bianca (parallel session)
=====================================

.. admonition::  Julia modules AKA Julia packages

   - UPPMAX have some pre-installed packages
   - This is helpful especially for Bianca (with no internet)
   - You can install own packages on Bianca as well.

.. questions::

   - How to check for and use the UPPMAX pre-installed packages?
   - How to install packages on Bianca?

.. objectives::

   - Show how to check for Julia packages
   - Show how to install own packages on Bianca


Check current available packages
--------------------------------

- Check the pre-installed packages of a specific Julia module:

.. code-block:: console

   $ module help julia/<version>

	
You may control the present "central library" by typing in Julia shell :

.. code-block:: julia

   using Pkg
   Pkg.activate(DEPOT_PATH[2]*"/environments/v1.8");     #change version accordingly
   Pkg.status()
   Pkg.activate(DEPOT_PATH[1]*"/environments/v1.8");     #to return to user library

A selection of the Julia packages and libraries installed on UPPMAX are:

- BenchmarkTools
- CSV
- CUDA
- MPI
- Distributed
- IJulia
- Plots
- PyPlot
- Gadfly
- DataFrames
- DistributedArrays
- PlotlyJS


Install own packages
--------------------

- On Rackham this works in the same way as gone through in the `Packages and isolated environments <https://uppmax.github.io/R-python-julia-HPC/julia/isolatedJulia.html>`_

To make sure that the package is not already installed, type in Julia:

.. code-block:: julia-repl

   julia> using Pkg
   julia> Pkg.activate(DEPOT_PATH[2]*"/environments/v1.8");  #change version accordingly
   julia> Pkg.status()

To go back to your own personal packages:

.. code-block:: julia-repl

   julia> Pkg.activate(DEPOT_PATH[1]*"/environments/v1.8");
   julia> Pkg.status()

To install personal packages you type within Julia:

.. code-block:: julia-repl

   julia>  Pkg.add("<package_name>")

This will install under the path ~/.julia/packages/. Then you can load it by just doing "using/import <package_name>".

.. code-block:: julia-repl

   julia> using <package_name>

You can also activate a "package prompt" in julia with   ']':

.. code-block:: julia

   (@v1.7) pkg> add <package name>

For installing specific versions specify with  <package name>@<X.Y.Z>.

After adding you may be asked to precompile or build. Do so according to instruction given on the screen. Otherwise, first time importing or using the package, Julia may start a precompilation that will take a few seconds up to several minutes.

Exit "package prompt" with <backspace>:

.. code-block:: julia-repl

   julia>

.. admonition:: Summary of workflow

   In addition to loading Julia, you will also often need to load site-installed modules for Julia packages,
   or use own-installed Julia packages. The work-flow would be something like this:


   1) Load Julia: `module load julia/<version>`` ``Julia`` at HPC2N
   2) Activate your virtual environment (optional) (this will be discussed in **Isolated environments**)
   3) Start Julia or run Julia script: ``julia``
   4) Install any extra Julia packages (optional): ``> Pkg.add <julia package>``

   Installed Julia packages can be accessed within Julia with ``using <package>``

   More about packages and virtual/isolated environment to follow in later sections of the course!

Installing on Bianca
--------------------

- `Installing <https://uppmax.github.io/bianca_workshop/julia/>`_


.. keypoints::

   - You can check for packages
   	- from the Julia shell with the ``using`` command
	- from BASH shell with the
		- ``ml help julia/1.8.5`` at UPPMAX
   - Installation of Julia packages can be done with Julia package manager.
   - You install own packages with the ``add`` command

