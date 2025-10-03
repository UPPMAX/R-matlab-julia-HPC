# Managing environments and packages


!!! info "Learning outcomes for this session"

    - How to work with Julias environment and package management.
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
versions. Include both of these files in your version control and you get
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


## Nested environments

The active environments can be seen with the command:

    julia>LOAD_PATH
    3-element Vector{String}:
    "@"
    "@v#.#"
    "@stdlib"

where `@` is the current environment, `@v#.#` is the default environment for the
Julia version that is being in use, and `@stdlib` is the standard library.

??? note "Site-installed packages in environments"

    At UPPMAX the central environment adds to the list with the element:

        "/sw/comp/julia/1.8.5/rackham/lib/glob_pkg/environments/v1.8"

Thus, by default in addition to the current environment other environments are present
which can potentially create conflicts for reproducibility if you are not aware of what
Julia is doing under the hood. Later on, we will see possible strategies to avoid this
situation.

### Customizing the set of visible environments

We saw previously that by default some environments are visible to new
environments. One can customize this setting with the variable
`JULIA_LOAD_PATH`, this can be done on the Linux command line:

    $ export JULIA_LOAD_PATH="path1:path2:..."

For instance, for including just the current environment we can set the value of
this variable as:

    $ export JULIA_LOAD_PATH="@"

Then, when we start a Julia session the default option will be the current
environment:

    julia> LOAD_PATH
    1-element Vector{String}:
    "@"

One can also modify the `LOAD_PATH` directly on the julian prompt with the
following functions:

    julia> empty!(LOAD_PATH)        # this will clean out the path
    julia> push!(LOAD_PATH, "@")    # it will add the current environment


### Environment stacks

As we saw before, `LOAD_PATH` shows that environments can be stacked and we can
place the environments we want in the path so that they are visible in our
current environment. To illustrate this concept, let's create a second
environment and first we can remove the content of `LOAD_PATH` (which path will
be different for you):

    julia> empty!(LOAD_PATH)
    shell> pwd
      /path-to-my-project/$USER/julia

    shell> mkdir my-second-env

    shell> cd my-second-env
    pkg> activate .

If we try to use the `DFTK` package we will see the error message:

    julia> using DFTK
      │ Package DFTK not found, but a package named DFTK is available from a registry.
      │ Install package?
      │   (my-second-env) pkg> add DFTK
      └ (y/n/o) [y]: n
       ERROR: ArgumentError: Package DFTK not found in current path.

If you remember this package was installed in the first environment
(`my-first-env`). In order to make this package available in our second
environment we can push the corresponding folder's path to `LOAD_PATH`:

    julia> push!(LOAD_PATH, "/path-to-my-project/$USER/julia/my-first-env/")
      1-element Vector{String}:
      "/path-to-my-project/$USER/julia/my-first-env/"

    julia> using DFTK

and now the package can be loaded from the first environment without errors.


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


## Bianca

- At Bianca there is a central library with installed packages.

- You may control the present "central library" by typing ``ml help julia/<version>`` in the BASH shell.
- A possibly more up-to-date status can be found from the Julia shell:

    julia> using Pkg
    julia> Pkg.activate(DEPOT_PATH[2]*"/environments/v1.8");     #change version (1.8) accordingly if you have another main version of Julia
    julia> Pkg.status()
    julia> Pkg.activate(DEPOT_PATH[1]*"/environments/v1.8");     #to return to user library

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


## Exercises

TODO: Make these exercises be the installation of the packages that we will later use.
It might be advisable to install IJulia and Pluto in separate environments.

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
