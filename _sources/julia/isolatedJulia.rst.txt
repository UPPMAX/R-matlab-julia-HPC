Packages and isolated environments
==================================


.. questions::

   - How to install packages?
   - How to work with isolated environments?
   - How to check for and use the UPPMAX pre-installed packages?
   

.. objectives:: 

   - Give a general *theoretical* introduction to isolated environments 
   - Show how to install own packages
   - Show how to check for Julia packages at UPPMAX
   
.. admonition:: Julia packages and environments
   
   - Julia **packages broaden the use of Julia** considerably! 
   - Instead of writing code yourself there may be others that have done the same!
   - Isolated environments solve a couple of problems:

      - You can install specific, also older, versions into them.
      - You can create one for each project and no problem if the two projects require different versions.
      - You can remove the environment and create a new one, if not needed or with errors.


Before going into installing packages let's have a background to the Julia environments and ecosystem!


In the Python's lesson on environments, we saw that there are different ways to deal with isolated 
environments in this language, for instance, ``conda`` and ``pip``. This situation is simplified
in Julia (if you are working with Julia code only) because environments are managed by Julia
itself. Julia distinguishes between **project environments** and **package directories** 
(`Julia environments <https://docs.julialang.org/en/v1/manual/code-loading/#Environments>`_). In the former, only the
Tom's Obvious Minimal Language (TOML) files (Project.toml, Manifest.toml) are present while in the
latter also source files are included with some specific layout. 

Packages are imported or loaded by the commands ``import`` and ``using``, respectively. The difference is (briefly):

    To use "module" functions, use ``import <module>`` to import the "module", and ``Module.fn(x)`` to use the functions.
    Alternatively, ``using <Module`` will import *all* exported Module functions into the *current namespace*, i.e. ``Module.fn(x)`` becomes ``fn(x)``.


If you have started Julia previously, you will get the folders like this in the ~/.julia folder.

.. code-block:: bash
   
   $ tree .julia/ -d -L 1
   .
   ├── artifacts
   ├── bin
   ├── compiled
   ├── conda
   ├── environments
   ├── logs
   ├── packages
   ├── prefs
   ├── registries
   └── scratchspaces



Packages in Julia work as decentralized units which can be connected through their 
universally unique identifiers (UUIDs) in the so-called federated package management. 
The active environments can be seen with the command:

.. code-block:: julia-repl

   julia>LOAD_PATH
   3-element Vector{String}:
   "@"
   "@v#.#"
   "@stdlib"

where ``@`` is the current environment, ``@v#.#`` is the default environment for the 
Julia version that is being in use, and ``@stdlib`` is the standard library. 
At UPPMAX the central environment adds to the list with the element:

.. code-block:: bash

   "/sw/comp/julia/1.8.5/rackham/lib/glob_pkg/environments/v1.8"

Thus, by default in addition to the current environment other environments are present
which can potentially create conflicts for reproducibility if you are not aware of what
Julia is doing under the hood. Later on, we will see possible strategies to avoid this
situation.

In a fresh Julia installation, we can see the following project information:

.. code-block:: julia-repl

   julia> using Pkg

   julia> Pkg.project()
   Pkg.API.ProjectInfo(nothing, nothing, nothing, false, Dict{String, Base.UUID}(), "/pfs/stor10/users/home/p/pojedama/.julia/environments/v1.8/Project.toml")

Here, we can see among other things that nothing (any package) has been added to project,
the UUID of the project, and the location of the *.toml* file.  
Let's install a package ``DFTK``, for instance, that performs Density Functional Theory
routines (`DFTK <https://juliapackages.com/p/dftk>`_):

.. code-block:: julia-repl

   julia> using Pkg
   julia> Pkg.add("DFTK")
           Info Packages marked with ⌅ have new versions available but compatibility constraints restrict them from upgrading. To see why use `status --outdated -m`
   Precompiling project...
   104 dependencies successfully precompiled in 43 seconds

Now, the project information tells us about the recently installed package:

.. code-block:: julia-repl

   julia> Pkg.project()
   Pkg.API.ProjectInfo(nothing, nothing, nothing, false, Dict{String, Base.UUID}("DFTK" => UUID("acf6eb54-70d9-11e9-0013-234b7a5f5337")), "/pfs/stor10/users/home/p/pojedama/.julia/environments/v1.8/Project.toml")


Create a project environment
----------------------------

Let's now create a **project environment**, this can be done as follows (if typing along, you have to change the path to your environment, like ``/proj/py-r-jl-m-rackham/$USER/julia`` on rackham):

.. type-along::

   .. code-block:: julia-repl

      julia> using Pkg
      julia>;
      shell> mkdir my-first-env
      shell> cd my-first-env
         /pfs/proj/nobackup/path/Julia-Test/my-first-env
      shell> #type backspace#
      julia> ]  
      (v1.8) pkg> activate . 
         Activating new project at `/pfs/proj/nobackup/path/Julia-Test/my-first-env`
      (my-first-env) pkg> #type backspace
      julia> ;
      shell> ls  
   
   We can see that our environment in parenthesis has been activated. At this stage nothing has been added in the folder *my-first-env* as you can see from the empty output of the ``ls`` command. 
   Notice that now that we are in this new environment, the default and standard library environments are also present as before:

   .. code-block:: julia-repl

      julia> LOAD_PATH
      3-element Vector{String}:
      "@"
      "@v#.#"
      "@stdlib"
   
   This can be confirmed if we try to load the ``DFTK`` package that we installed previously as the command ``using DFTK`` will execute without any complaints. If we install the ``DFTK`` package we will notice some differences w.r.t. the previous installation: 

   .. code-block:: julia

      (my-first-env) pkg> add DFTK 
      Resolving package versions...
      Updating `/pfs/proj/nobackup/path/Julia-Test/my-first-env/Project.toml`
      [acf6eb54] + DFTK v0.6.2
       Updating `/pfs/proj/nobackup/path/Julia-Test/my-first-env/Manifest.toml`

   First, we notice that installation was much faster than before. This is because **Pkg** did not do a new installation but it just updated our environment with information of the available ``DFTK`` package. Specifically, if you take a look at the content of the current directory you will see the new files ``Project.toml`` and ``Manifest.toml``, the ``more`` command can display the content of these files:

   .. code-block:: julia-repl

      shell> ls
      Manifest.toml  Project.toml

      shell> more Project.toml 
      [deps]
      DFTK = "acf6eb54-70d9-11e9-0013-234b7a5f5337"
   
      shell> more Manifest.toml
      # This file is machine-generated - editing it directly is not advised
   
      julia_version = "1.8.5"
      manifest_format = "2.0"
      project_hash = "48bbaa26b07ee1ca85ad746dc9b2f772ba10b675"

      [[deps.AbstractFFTs]]
      deps = ["ChainRulesCore", "LinearAlgebra"]
      git-tree-sha1 = "69f7020bd72f069c219b5e8c236c1fa90d2cb409"
      uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
      version = "1.2.1"

      [[deps.Adapt]]
      deps = ["LinearAlgebra"]
      git-tree-sha1 = "195c5505521008abea5aee4f96930717958eac6f"
      uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
      version = "3.4.0"

      ...   

   Here, we notice that the ``Project.toml`` only gives us the UUID of the project while the ``Manifest.toml`` file contains the full information about the dependencies versions and organization layout. Notice the message regarding editing for the latter. Let's leave this environment: 


   .. code-block:: julia

      (my-first-env) pkg> activate 
          Activating project at `~/.julia/environments/v1.8`

      (v1.8) pkg> 

   Once you have created an environment, it can be activated in several manners. The one we saw before is by activating it in ``package`` mode with the command ``activate .``. You may also be able to activate the environment inside the Julia script by calling these lines in your ``.jl`` file:

   .. code-block:: julia-repl

      julia> using Pkg
      julia> Pkg.activate(".")

   Besides the previous two options for activating an environment, you can also activate it on the Linux command line (assuming that you are located in the environment directory): 

   .. code-block:: console

      $ julia --project=. 

Create a package environment
----------------------------

A package environment can be created by using the ``generate`` function in ``package mode``
or ``Pkg.generate()`` in ``Julian`` mode:

.. code-block:: julia

   (v1.8) pkg> generate myfirstpackage 
     Generating  project myfirstpackage:
     myfirstpackage/Project.toml
     myfirstpackage/src/myfirstpackage.jl

In contrast to the ``project environment``, the ``package environment`` has a default file
structure, see for instance the **src** directory that is created.
One can activate this environment in the following way:

.. code-block:: julia

   shell> cd myfirstpackage 
   (v1.8) pkg> activate . 
   Activating project at `/pfs/proj/nobackup/path/Julia-Test/my-first-env/myfirstpackage`
   (myfirstpackage) pkg> 


The ``project`` function tells us that the current project has an UUID assigned to it:

.. code-block:: julia-repl

   julia> Pkg.project()
   Pkg.API.ProjectInfo("myfirstpackage", UUID("ca799254-944c-4043-b9e3-b70b93409f34"), v"0.1.0", true, Dict{String, Base.UUID}(), "/pfs/proj/nobackup/path/Julia-Test/my-first-env/myfirstpackage/Project.toml")

As in the ``project environment``, the ``package environment`` can see the default and 
the standard library environments. 

Let's add the package ``Flux`` for Machine Learning routines:

.. code-block:: julia

   (myfirstpackage) pkg> add Flux
     Precompiling project...
     49 dependencies successfully precompiled in 92 seconds. 43 already precompiled.
   (myfirstpackage) pkg> status
     Project myfirstpackage v0.1.0
     Status `/pfs/proj/nobackup/path/Julia-Test/my-first-env/myfirstpackage/Project.toml`
     [587475ba] Flux v0.13.11

where the status function tells us information about the packages that are installed
in the current environment, for instance the ``Flux`` version that we just installed.


Customizing the set of visible environments
-------------------------------------------

We saw previously that by default some environments are visible to new environments.
One can customize this setting with the variable ``JULIA_LOAD_PATH``, this can be
done on the Linux command line:


.. code-block:: console

   $ export JULIA_LOAD_PATH="path1:path2:..."

For instance, for including just the current environment we can set the value of 
this variable as:

.. code-block:: console

   $ export JULIA_LOAD_PATH="@"

Then, when we start a Julia session the default option will be the current
environment:

.. code-block:: julia-repl
   
   julia> LOAD_PATH
   1-element Vector{String}:
   "@"

One can also modify the ``LOAD_PATH`` directly on the julian prompt with the following
functions:


.. code-block:: julia-repl
   
   julia> empty!(LOAD_PATH)        # this will clean out the path
   julia> push!(LOAD_PATH, "@")    # it will add the current environment


Environment stacks
------------------

As we saw before, ``LOAD_PATH`` shows that environments can be stacked and we can place
the environments we want in the path so that they are visible in our current environment.
To illustrate this concept, let's create a second environment and first we can remove the
content of ``LOAD_PATH`` (which path will be different for you):

.. code-block:: julia-repl

   julia> empty!(LOAD_PATH)
   shell> pwd
      /pfs/proj/nobackup/path/Julia-Test

   shell> mkdir my-second-env

   shell> cd my-second-env
   pkg> activate .

If we try to use the ``DFTK`` package we will see the error message:

.. code-block:: julia-repl

   julia> using DFTK
      │ Package DFTK not found, but a package named DFTK is available from a registry. 
      │ Install package?
      │   (my-second-env) pkg> add DFTK 
      └ (y/n/o) [y]: n
       ERROR: ArgumentError: Package DFTK not found in current path.

If you remember this package was installed in the first environment (``my-first-env``). In order
to make this package available in our second environment we can push the corresponding folder's
path to ``LOAD_PATH``:

.. code-block:: julia-repl

   julia> push!(LOAD_PATH, "/pfs/proj/nobackup/path/Julia-Test/my-first-env/")
      1-element Vector{String}:
      "/pfs/proj/nobackup/path/Julia-Test/my-first-env/"

   julia> using DFTK

and now the package can be loaded from the first environment without errors.

UPPMAX Central library
######################

.. admonition:: Please notice

   - At UPPMAX there is a central library with installed packages.
   - This is good, especially when working on Bianca, since you don't need to install via the Wharf.
   - If you work on Rackham you can actually ignore it and do all installations by yourself. The reason is that you need some more steps.

- You may control the present "central library" by typing ``ml help julia/<version>`` in the BASH shell.
- A possibly more up-to-date status can be found from the Julia shell:

.. code-block:: julia-repl 

   julia> using Pkg
   julia> Pkg.activate(DEPOT_PATH[2]*"/environments/v1.8");     #change version (1.8) accordingly if you have another main version of Julia
   julia> Pkg.status()
   julia> Pkg.activate(DEPOT_PATH[1]*"/environments/v1.8");     #to return to user library

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

   .. tab:: LUNARC

        The Julia versions installed at LUNARC include only the Base and Standard library
        modules.

Exercises
---------


.. challenge:: 1. Project environment
    
    Create a project environment called ``new-env`` and activate it. Then, install the
    package ``CSV`` in this environment. For your knowledge, ``CSV`` is a package that
    offers tools for dealing with ``.csv`` files. After this, check that this package
    was installed. Finally, deactivate the environment.

    .. solution:: Solution for all centres
        :class: dropdown
            
            .. code-block:: julia
    
                shell> mkdir new-env
                shell> cd new-env
                (@v1.8) pkg> activate .
                      Activating new project at `path-to-folder\new-env`
                (new-env) pkg> add CSV
                (new-env) pkg> status
                      Status `path-to-folder\new-env\Project.toml`
                      [336ed68f] CSV v0.10.9
                (new-env) pkg> activate 

.. challenge:: 2. Package environment
    
    Create a package environment called ``new_pack`` and activate it. Then, install the
    package ``CSV`` in this environment. For your knowledge, ``CSV`` is a package that
    offers tools for dealing with ``.csv`` files. After this, check that this package
    was installed. Finally, deactivate the environment.

    .. solution:: Solution for all centres
        :class: dropdown
            
            .. code-block:: julia
    
                shell> pwd            #Check were you are currently located
                (@v1.8) pkg> generate new_pack
                     Generating  project new_pack:
                     new_pack\Project.toml
                     new_pack\src\new_pack.jl
                shell> cd new_pack
                     `path-to-folder\new_pack`
                (@v1.8) pkg> activate .
                       Activating project at `path-to-folder\new_pack`
                (new_pack) pkg> add CSV 
                (new_pack) pkg> status
                       Project new_pack v0.1.0
                       Status `path-to-folder\new_pack\Project.toml`
                       [336ed68f] CSV v0.10.9
                (new_pack) pkg> activate


.. keypoints::

   - Installation of Julia packages can be done with Julia package manager.
   - You install packages with the ``add`` command
   - With a virtual environment you can tailor an environment with specific versions for Julia
     and packages, not interfering with other installed Julia versions and packages.
   - Make it for each project you have for reproducibility.
   - The environments in Julia are lightweight so it is recommended to start a new environment
     for each project that you are developing. 
   - Environments in Julia created by Julia itself so third party software are not required.
   - You can check for centrally installed packages at UPPMAX
      - from the Julia shell 
      - from BASH shell with ``ml help julia/1.8.5``

   
 
   
