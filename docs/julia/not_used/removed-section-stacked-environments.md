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

