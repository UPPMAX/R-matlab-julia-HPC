Packages
========

.. admonition::  Julia modules AKA Julia packages

   - Julia **packages broaden the use of Julia** considerably!

   - Instead of writing code yourself there may be others that have done the same!

.. questions::

   - How do I find which packages and versions are available?
   - What to do if I need other packages?
   - Are there differences between HPC2N and UPPMAX?

.. objectives::

   - Show how to check for Julia packages
   - show how to install own packages on the different clusters


Check current available packages
--------------------------------

General for both centers
########################

.. tabs::

   .. tab:: UPPMAX

	Check the pre-installed packages of a specific Julia module:

	.. code-block:: sh

	   $ module help julia/<version> 

	
   .. tab:: HPC2N

        The Julia versions installed at HPC2N include only the Base and Standard library
        modules.

Check the pre-installed packages of a loaded Julia module, in shell:

UPPMAX
######

You may control the present "central library" by typing in Julia shell :

.. code-block:: julia

   using Pkg
   Pkg.activate(DEPOT_PATH[2]*"/environments/v1.7");     #change version accordingly
   Pkg.status()
   Pkg.activate(DEPOT_PATH[1]*"/environments/v1.7");     #to return to user library

Packages are imported or loaded by the commands ``import`` and ``using``, respectively. The difference is shown here. Or briefly:

    To use module functions, use import Module to import the module, and Module.fn(x) to use the functions.
    Alternatively, using Module will import all exported Module functions into the current namespace.

A selection of the Julia packages and libraries installed on UPPMAX and HPC2N are:

.. tabs::

   .. tab:: UPPMAX

	The Julia application at UPPMAX comes with several preinstalled packages.
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

   .. tab:: HPC2N

        The Julia versions installed at HPC2N include only the Base and Standard library
        modules.


Install own packages
--------------------

To make sure that the package is not already installed, type in Julia:

.. code-block:: julia

   using Pkg
   Pkg.activate(DEPOT_PATH[2]*"/environments/v1.7");  #change version accordingly

   Pkg.status()

To go back to your own personal packages:

.. code-block:: julia

   Pkg.activate(DEPOT_PATH[1]*"/environments/v1.7");
   Pkg.status()

You can load (using/import) ANY package from both local and central installation irrespective to which environment you activate. However, the setup is that your package is prioritized if there are similar names.

To install personal packages you type within Julia:

.. code-block:: julia

   Pkg.add("<package_name>")

This will install under the path ~/.julia/packages/. Then you can load it by just doing "using/import <package_name>".

.. code-block:: julia

   using <package_name>

You can also activate a "package prompt" in julia with   ']':

.. code-block:: julia

   (@v1.7) pkg> add <package name>

For installing specific versions specify with  <package name>@<X.Y.Z>.

After adding you may be asked to precompile or build. Do so according to instruction given on the screen. Otherwise, first time importing or using the package, Julia may start a precompilation that will take a few seconds up to several minutes.

Exit "package prompt" with <backspace>:

.. code-block:: julia

   julia>

.. note::

   You will test this in the separated sessions about isolated environments in a while.

.. admonition:: Summary of workflow

   In addition to loading Julia, you will also often need to load site-installed modules for Julia packages,
   or use own-installed Julia packages. The work-flow would be something like this:


   1) Load Julia: `module load julia/<version>`` ``Julia`` at HPC2N
   2) Activate your virtual environment (optional) (this will be discussed in **Isolated environments**)
   3) Start Julia or run Julia script: ``julia``
   4) Install any extra Julia packages (optional): ``> Pkg.add <julia package>``

   Installed Julia packages can be accessed within Julia with ``using <package>``

   More about packages and virtual/isolated environment to follow in later sections of the course!



.. keypoints::

   - You can check for packages
   	- from the Julia shell with the ``using`` command
	- from BASH shell with the
		- ``ml help julia/1.8.5`` at UPPMAX
   - Installation of Julia packages can be done with Julia package manager.
   - You install own packages with the ``add`` command

