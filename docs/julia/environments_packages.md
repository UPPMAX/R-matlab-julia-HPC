# Managing environments and packages


!!! info "Learning outcomes for this session"

    - How to work with Julia's environment and package management.
    - How to check for and use site-installed packages, if any.


!!! info "Your background?"

    - Have you used Python?
    - Have you used Matlab? Were you at yesterdays Matlab sessions?
    - Have you used Git?
    - Are you completely new to this, code packages and version control?

!!! info "Key points"

    - Environments
        - Project
        - Version control
        - Nested, base, tools not part of the project, use with caution
    - Packages


## Introduction

Packages are pieces of software to be used by your scripts or interactive
sessions as-is or modified, stand-alone or---most often---in combinations to
make a full toolkit customized to your task. Such a toolkit may itself become a
new package. Packages allow us to cooperate on code that can be useful in
several places.

Environments are sets of packages that are available for use simultaneously and,
if all is right, work together.

If you come from Python, you have likely seen that there are several different
ways to deal with environments and package management in this language, for
instance, `conda` and `pip`. The situation can be described as several
ecosystems of packages. You may have come across the term "dependency hell" or
even had a taste (or perhaps far more than you could stomach) of this yourself.

Julia comes with a great system for environments and packages included. As a
result there is essentially a single ecosystem of packages and "dependency hell"
is as close to eliminated as it can be.

Julia environments are defined by two TOML (Tom's Obvious Minimal Language)
files, `Project.toml` and `Manifest.toml`. The former specifies which packages
you've asked for, the latter specifies all packages loaded including their exact
versions. Include both of these files (`Project.toml` all the time, `Manifest.toml` at points for which you want exact reproducibility) in your version control and you get
traceable, reproducible environments with minimal effort!


## Getting started

To get started we will go to the Julia documentation and make use of the
official tutorial on the Julia package manager:
<https://docs.julialang.org/en/v1/stdlib/Pkg/#Pkg>

### Summary of what we've seen so far

- Get to the Pkg REPL by pressing `]` in the Julia REPL
- In the Pkg REPL, use the following commands:
    - `?` to get help
    - `activate` to activate an existing or new environment
    - `st` (alias for `status`) to see which packages have been added to the active environment
    - `add` to add packages to the active environment, this may or may not have download and precompilation steps that take a bit of time
    - `rm` (alias for `remove`) to remove packages from the active environment
    - `up` (alias for `update`) to update packages in the active environment
- `Project.toml` stores what packages you've asked for
- `Manifest.toml` stores how Pkg resolved this, with all dependencies and exact versions

!!! note "Environment stacking"

    When you have not activated any specific environment, the active environment
    is your personal base environment for the Julia version you're currently
    running (called e.g. @v1.11). This is normally reachable in addition to your
    active environment. This can be a convenient way to access development
    tools that you want active but your project *does not depend on*.

    If you have tools available through your base environment and you need to
    check that your project can be reproduced properly without your base
    environment, you'll want to read this:

    ??? note "Loading project environment *only*"

        The full stack of reachable environments are defined by the global Julia variable
        [`LOAD_PATH`](https://docs.julialang.org/en/v1/base/constants/#Base.LOAD_PATH):

            julia>LOAD_PATH
            3-element Vector{String}:
            "@"
            "@v#.#"
            "@stdlib"

        where `@` is the active environment, `@v#.#` is your base environment for the
        Julia version in use, and `@stdlib` is the standard library.

        To include just the current environment we can modify the `LOAD_PATH`
        variable from the julian prompt with the following functions:

            julia> empty!(LOAD_PATH)        # this will clean out the path
            julia> push!(LOAD_PATH, "@")    # this will add the current environment



## But where are the packages installed?

Each environment only consists of two files, the code is not here. Packages will
be installed to and loaded from paths defined by the global Julia variable
[`DEPOT_PATH`](https://docs.julialang.org/en/v1/base/constants/#Base.DEPOT_PATH).
In a default Julia installation this will include:

1. `~/.julia` where `~` is the user home as appropriate on the system;
1. an architecture-specific shared system directory, e.g. `/usr/local/share/julia`;
1. an architecture-independent shared system directory, e.g. `/usr/share/julia`.

You may want to take a look at what it contains on your cluster.

Packages can consist of relatively many files and some clusters have a limit on
the number of files you can have in your home directory. If this becomes a
problem, talk to us and we will find a way.


## Using packages

Packages are imported or loaded by the commands `import` and `using`,
respectively. The difference is (briefly):

> To use "module" functions, use `import <module>` to import the "module", and
> `Module.fn(x)` to use the functions. Alternatively, `using <Module>` will
> import *all* exported Module functions into the *current namespace*, i.e.
> `Module.fn(x)` becomes `fn(x)`.


## Non-interactive use of Pkg

Once you have created an environment, it can be activated in several manners.
The one we saw before is by activating it in `package` mode with the command
`activate .`. You may also be able to activate the environment inside the
Julia script by calling these lines in your `.jl` file:

    julia> using Pkg
    julia> Pkg.activate(".")

Besides the previous two options for activating an environment, you can also
activate it on the Linux command line (assuming that you are located in the
environment directory):

    julia --project=.


???- note "Bianca"

    - At Bianca there is a central library with installed packages.

    - You may control the present "central library" by typing ``ml help julia/<version>`` in the BASH shell.
    - A possibly more up-to-date status can be found from the Julia shell:

    ```{ .julia-repl }
    julia> using Pkg
    julia> Pkg.activate(DEPOT_PATH[2]*"/environments/v1.8");     #change version (1.8) accordingly if you have another main version of Julia
    julia> Pkg.status()
    julia> Pkg.activate(DEPOT_PATH[1]*"/environments/v1.8");     #to return to user library
    ```
    
    A selection of the Julia packages and libraries installed on Bianca are:

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

    !!! note "Site-installed packages in environments"

        At Bianca the central environment adds to the environment stack:

            julia> LOAD_PATH
            4-element Vector{String}:
              "@"
              "@v#.#"
              "@stdlib"
              "/sw/comp/julia/1.8.5/rackham/lib/glob_pkg/environments/v1.8"


## Exercises

- We nee the packages ``IJulia`` and ``Pluto`` for running the integrated development environments (IDEs) Jupyter and Pluto.

- Make these exercises be the installation of the packages that we will later use.
- It might be advisable to install IJulia and Pluto in separate environments.

!!! challenge "1. Install Pluto"

    - It may take 5-10 minutes or so.
    - This you can do in an ordinary terminal

    === "NSC"

        ```bash
        $ ml julia/1.10.2-bdist
        $ julia
        ```

    === "PDC"

         Note: not fully tested successfully, but this step works

         ```bash
         $ ml PDC/23.12 julia/1.10.2-cpeGNU-23.12
         $ julia
         ```

    === "UPPMAX (Bianca/Rackham)"

        ```bash
         $ module load julia/1.8.5
        ```

    === "UPPMAX (Pelle)"

         ```bash
         $ module load Julia/1.10.9-LTS-linux-x86_64
         ```

    === "HPC2N & LUNARC"

         ```bash
         $ module load GCCcore/13.2.0  Julia/1.9.3-linux-x86_64
         $ julia
         ```

    In Julia for all clusters (output may differ for different clusters and Julia versions):

    ```julia
        shell> mkdir pluto-env
        shell> cd pluto-env
        (@v1.10) pkg> activate .
          Activating new project at `path-to-folder\new-env`
        (new-env) pkg> add Pluto
        (new-env) pkg> status
                Status `path-to-folder\new-env\Project.toml`
                [c3e4b0f8] Pluto v0.20.19
        (new-env) pkg> deactivate
    ```
 

!!! challenge "2. Install IJulia"

    - This is done only once, but for each combination of Julia you would like to use.
    - Also Python must be loaded
    - It may take 5-10 minutes or so.
    - This you can do in an ordinary terminal (book an interactive session, for safety)
   
    === "NSC"

        ```bash
        $ ml Python/3.11.5-env-hpc1-gcc-2023b-eb
        $ ml julia/1.10.2-bdist
        $ julia
        ```

    === "PDC"

         ```bash
         $ ml PDC/23.12 julia/1.10.2-cpeGNU-23.12
         $ ml cray-python/3.11.5
         $ julia
         ```

    === "UPPMAX (Bianca/Rackham)"

        ```bash
        $ module load julia/1.8.5
        $ module load python/3.9.5
        $ julia
        ```

    === "UPPMAX (Pelle)"

        ```bash
        $ module load julia/1.8.5
        $ module load python/3.9.5
        $ julia
        ```

    === "HPC2N & LUNARC"

        ```bash
        $ module load GCCcore/13.2.0  JupyterLab/4.2.0
        $ module load Julia/1.8.5-linux-x86_64
        $ julia
        ```

    In Julia for all clusters (output may differ for different clusters and Julia versions):

    ```julia
        shell> mkdir jupyter-env
        shell> cd jupyter-env
        (@v1.10) pkg> activate .
          Activating new project at `path-to-folder\new-env`
        (new-env) pkg> add Pluto
        (new-env) pkg> status
                Status `path-to-folder\new-env\Project.toml`
                [7073ff75] IJulia v1.27.0
        (new-env) pkg> deactivate
    ```

!!! example "Extra Challenge. Project environment with csv"

    Create a project environment called ``new-env`` and activate it. Then, install the
    package ``CSV`` in this environment. For your knowledge, ``CSV`` is a package that
    offers tools for dealing with ``.csv`` files. After this, check that this package
    was installed. Finally, deactivate the environment.

    ??? note "Solution for all centres"

       ``` julia

                shell> mkdir new-env
                shell> cd new-env
                (@v1.8) pkg> activate .
                      Activating new project at `path-to-folder\new-env`
                (new-env) pkg> add CSV
                (new-env) pkg> status
                      Status `path-to-folder\new-env\Project.toml`
                      [336ed68f] CSV v0.10.9
                (new-env) pkg> deactivate
        ```

!!! summary

    - Environments in Julia created by Julia itself so third party software are not required.
    - With a virtual environment you can tailor an environment with specific versions for Julia
     and packages, not interfering with other installed Julia versions and packages.
    - Make it for each project you have for reproducibility.
    - The environments in Julia are lightweight so it is recommended to start a new environment
     for each project that you are developing.
    - Bianca

!!! info "Extra reading"

    - [Julia environments](https://docs.julialang.org/en/v1/manual/code-loading/#Environments)
