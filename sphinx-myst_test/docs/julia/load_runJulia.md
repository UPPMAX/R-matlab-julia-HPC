# Load and run Julia

:::{note}
At the Swedish HPC centers we call the applications available via the *module system* **modules**:

- [NSC](https://www.nsc.liu.se/software/modules/)
- [PDC](https://support.pdc.kth.se/doc/contact/contact_support/?sub=software/module/)
- [UPPMAX](https://docs.uppmax.uu.se/cluster_guides/modules/)
- [HPC2N](https://docs.hpc2n.umu.se/software/modules/)
- [LUNARC](https://lunarc-documentation.readthedocs.io/en/latest/manual/manual_modules/#hierarchical-naming-scheme-concept)
:::

```{eval-rst}
.. objectives::

   - Learn to load Julia
   - Get started with the Julia command line
   - Learn to run Julia scripts
```

```{eval-rst}
.. instructor-note::
   :class: dropdown

   - Lecture and demo 15 min
   - Exercise 15 min
   - Total time 30 min
```

Julia can be started after a Julia module is loaded.
The module activates paths to a specific version of the julia interpreter and its libraries and packages.

:::{admonition} Short cheat sheet
:class: dropdown

- See which modules exists: `module spider` or `ml spider`.
- Find module versions for a particular software: `module spider <software>`
- Modules depending only on what is currently loaded: `module avail` or `ml av`
- See which modules are currently loaded: `module list` or `ml`
- Load a module: `module load <module>/<version>` or `ml <module>/<version>`
- Unload a module: `module unload <module>/<version>` or `ml -<module>/<version>`
- Unload all modules except the 'sticky' modules: `module purge` or `ml purge`
:::

:::{warning}
Note that the module systems at UPPMAX and HPC2N are slightly different.
All modules at UPPMAX, for instance, not directly related to bio-informatics are shown by `ml avail`.

Modules at many other centres are only available when one has loaded all prerequisites,
:::

for instance the compilers (`GNU`, `Intel`, etc.).

## Check for Julia versions

### Principle

- For some clusters

```console
$ module avail julia
```

:::{admonition} How will it look like?
:class: dropdown

Example output for Tetralith

```console
$ module avail julia
---------------------------------- /software/sse2/tetralith_el9/modules -----------------------------------
   julia/recommendation          (D)    julia/1.6.1-nsc1-bdist    julia/1.9.4-bdist
   julia/1.1.0-nsc1-gcc-2018a-eb        julia/1.7.2-nsc1-bdist    julia/1.10.2-bdist
   julia/1.4.1                          julia/1.8.5-nsc1-bdist


 Where:
  D:  Default Module

Use "module spider" to find all possible modules and extensions.
Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".
```
:::

- Or, at clusters that hides the modules until relevant dependencies are loaded (HPC2N & PDC)

```console
$ module spider julia
```

:::{admonition} How will it look like?
:class: dropdown

Example output for Dardel

```console
$ module spider julia
-------------------------------------------------------------------------------------------------------
  julia:
-------------------------------------------------------------------------------------------------------
    Description:
      Julia is a high-level general-purpose dynamic programming language that was originally designed
      to address the needs of high-performance numerical analysis and computational science, without
      the typical need of separate compilation to be fast, also usable for client and server web use,
      low-level systems programming or as a specification language (wikipedia.org). Julia provides
      ease and expressiveness for high-level numerical computing, in the same way as languages such as
      R, MATLAB, and Python, but also supports general programming. To achieve this, Julia builds upon
      the lineage of mathematical programming languages, but also borrows much from popular dynamic
      languages, including Lisp, Perl, Python, Lua, and Ruby (julialang.org).

     Versions:
        julia/1.8.2-cpeGNU-22.06
        julia/1.9.3-cpeGNU-22.06
        julia/1.9.3-cpeGNU-23.03
        julia/1.10.2-cpeGNU-23.03
        julia/1.10.2-cpeGNU-23.12
     Other possible modules matches:
        Julia  libuv-julia

-------------------------------------------------------------------------------------------------------
  To find other possible module matches execute:

      $ module -r spider '.*julia.*'

-------------------------------------------------------------------------------------------------------
  For detailed information about a specific "julia" package (including how to load the modules) use the module's full name.
  Note that names that have a trailing (E) are extensions provided by other modules.
  For example:

     $ module spider julia/1.10.2-cpeGNU-23.12
-------------------------------------------------------------------------------------------------------
```
:::

## Load a Julia module

For reproducibility, we recommend ALWAYS loading a specific module for the Julia version instead of using the
default one.

### Principle

- Use the overview of existing module above!
- Load the module!

At some clusters:

```console
$ module load julia/1.8.5
```

or at cluster that includes "architecture" or "build name" in module name:

```console
$ ml julia/1.10.2-bdist
```

Some clusters will require other modules to be loaded (Kebnekaise and Dardel)

- First check how to load (see Check for Julia versions above)

```console
$ module spider julia/1.10.2-cpeGNU-23.12

  ...
  You will need to load all module(s) on any one of the lines below before the "julia/1.10.2-cpeGNU-23.12" module is available to load.

  PDC/23.12
```

- Load PDC/23.12 first and then the julia module

```console
$ ml PDC/23.12 julia/1.10.2-cpeGNU-23.12
```

## Run

### Run Julia as a session

- After loading the appropriate modules for Julia, you will have access to the **read-eval-print-loop (REPL)** command line by typing `julia`:

```console
$ julia
```

- In julia REPL

:::{admonition} How will it look like?
:class: dropdown

```julia-repl
$ ml julia/1.8.5
$ julia

      _       _ _(_)_     |  Documentation: https://docs.julialang.org
     (_)     | (_) (_)    |
      _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
     | | | | | | |/ _` |  |
     | | |_| | | | (_| |  |  Version 1.8.5 (2023-01-08)
    _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
   |__/                   |

julia>
```
:::

#### Modes: Julian mode

- Julia has different modes, the one we arrive at is the so-called `Julian` mode, where one can execute commands.
- The description for accessing these modes will be given in the following paragraphs.
- Once you are done with your work in any of the modes, you can return to the `Julian` mode by pressing the `backspace` key.

#### Shell mode

While being on the Julian mode you can enter the `shell` mode by typing `;`:

```julia
julia>;
shell>pwd
/current-folder-path
```

this will allow you to use Linux commands. Notice that the availability of these commands
depend on the OS, for instance, on Windows it will depend on the terminal that you have
installed and if it is visible to the Julia installation.

#### Package manage mode

Another mode available in Julia is the `package manager` mode, it can be accessed by typing
`]` in the `Julian` mode:

```julia-repl
julia>]
(v1.8) pkg>
```

this will make your interaction with the package manager **Pkg** easier, for instance,
instead of typing the complete name of **Pkg** commands such as `Pkg.status()` in the
`Julian` mode, you can just type `status` in the `package` mode.

#### Help mode

The last mode is the `help` mode, you can enter this mode from the `Julian` one by
typing `?`, then you may type some string from which you need more information:

```julia
julia>?

help?> ans
search: ans transpose transcode contains expanduser instances MathConstants readlines
LinearIndices leading_ones leading_zeros

ans

A variable referring to the last computed value, automatically set at the interactive prompt.
```

#### Exiting

Exit with

```julia-repl
julia> <Ctrl-D>
```

or

```julia-repl
julia> exit()
```

:::{admonition} The Julian modes summary
- enter the *shell mode* by typing `;`
- go back to *Julian* mode by `<backspace>`
- access the *package manager* mode by typing `]` in the *Julian* mode
- use the *help mode* by typing `?` in the *Julian mode*
:::

:::{seealso}
[More detailed information about the modes in Julia can be found](https://docs.julialang.org/en/v1/stdlib/REPL/).
:::

### Run a Julia script

You can run a Julia script on the Linux shell as follows:

```console
$ julia example.jl
```

where the script is a text file could contain these lines:

```bash
println("hello world")
```

## Exercises

```{eval-rst}
.. challenge:: 1a. Find out which versions are on your cluster from documentation

   - Find/search for that documentation!

   .. solution:: Solution
      :class: dropdown

      - `UPPMAX <http://docs.uppmax.uu.se/software/julia/>`_
      - `HPC2N <https://www.hpc2n.umu.se/resources/software/julia>`_
      - `LUNARC <The user demand on Julia has been low, so there is currently no site-specific documentation.>`_
      - `NSC <https://www.nsc.liu.se/software/installed/tetralith/julia/>`_
      - `PDC <https://support.pdc.kth.se/doc/applications/>`_


```

```{eval-rst}
.. challenge:: 1b. Find out which versions are on your cluster from command line

   - Use the ``spider`` or ``avail`` module commands

   .. solution:: Solution
      :class: dropdown

      .. tabs::

         .. tab:: UPPMAX

           Check all available Julia versions with:

            .. code-block:: console

                $ module avail julia


         .. tab:: HPC2N

            Check all available version Julia versions with:

            .. code-block:: console

               $ module spider julia

            Notice that the output if you are working on the Intel (*kebnekaise.hpc2n.umu.se*) or AMD
            (*kebnekaise-amd.hpc2n.umu.se*) login nodes is different. In the former, you will see more
            installed versions of Julia as this hardware is older.

            To see how to load a specific version of Julia, including the prerequisites, do

            .. code-block:: console

               $ module spider Julia/<version>

            Example for Julia 1.8.5

            .. code-block:: console

               $ module spider Julia/1.8.5-linux-x86_64

         .. tab:: LUNARC

            Check all available version Julia versions with:

            .. code-block:: console

               $ module spider Julia

            To see how to load a specific version of Julia, including the prerequisites, do

            .. code-block:: console

               $ module spider Julia/<version>

            Example for Julia 1.8.5

            .. code-block:: console

               $ module spider Julia/1.8.5-linux-x86_64

         .. tab:: Tetralith

            Check all available version Julia versions with:

            .. code-block:: console

               $ module avail Julia

            Example for Julia 1.8.5

            .. code-block:: console

               $ module spider julia/1.8.5-nsc1-bdist

         .. tab:: Dardel

            Check all available version Julia versions with:

            .. code-block:: console

               $ module spider Julia

            To see how to load a specific version of Julia, including the prerequisites, do

            .. code-block:: console

               $ module spider Julia/<version>

            Example for Julia 1.8.5

            .. code-block:: console

               $ module spider Julia/1.8.5-linux-x86_64
```

:::{admonition} Output at UPPMAX as of Oct 2024
:class: dropdown

> ```console
> $ module avail julia
> ----------------------------- /sw/mf/rackham/compilers -----------------------------
>    julia/1.0.5_LTS    julia/1.6.1        julia/1.7.2        julia/1.9.3 (D)
>    julia/1.1.1        julia/1.6.3        julia/1.8.5 (L)
>    julia/1.4.2        julia/1.6.7_LTS    julia/1.9.1
>
>  Where:
>   D:  Default Module
>
> Use "module spider" to find all possible modules and extensions.
> Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".
> ```
:::

:::{admonition} Output at HPC2N as of Oct 2024
:class: dropdown

> ```console
> $ module spider julia  # Assuming you are working on the Intel login nodes
> ------------------------------------------------------------------------------------------------
>   Julia:
> ------------------------------------------------------------------------------------------------
>   Description:
>     Julia is a high-level, high-performance dynamic programming language for numerical
>     computing
>
>   Versions:
>      Julia/1.5.3-linux-x86_64
>      Julia/1.7.1-linux-x86_64
>      Julia/1.8.5-linux-x86_64
>      Julia/1.9.3-linux-x86_64
> ------------------------------------------------------------------------------------------------
>   For detailed information about a specific "Julia" package (including how to load the modules) use the module's full name.
>   Note that names that have a trailing (E) are extensions provided by other modules.
>   For example:
>
>      $ module spider Julia/1.8.5-linux-x86_64
> ------------------------------------------------------------------------------------------------
> ```
:::

:::{admonition} Output at LUNARC as of Oct 2024
:class: dropdown

> ```console
> $ module spider julia
> -----------------------------------------------------------------------------------------------------
>   Julia:
> -----------------------------------------------------------------------------------------------------
>     Description:
>       Julia is a high-level, high-performance dynamic programming language for numerical computing
>
>      Versions:
>         Julia/1.8.5-linux-x86_64
>         Julia/1.9.0-linux-x86_64
>         Julia/1.9.2-linux-x86_64
>         Julia/1.9.3-linux-x86_64
>         Julia/1.10.4-linux-x86_64
> ```
:::

:::{admonition} Output at NSC as of Mar 2025
:class: dropdown

> ```console
> $ module avail julia
>
> ---------------------------------- /software/sse2/tetralith_el9/modules -----------------------------------
>    julia/recommendation          (D)    julia/1.6.1-nsc1-bdist    julia/1.9.4-bdist
>    julia/1.1.0-nsc1-gcc-2018a-eb        julia/1.7.2-nsc1-bdist    julia/1.10.2-bdist
>    julia/1.4.1                          julia/1.8.5-nsc1-bdist
> ```
:::

:::{admonition} Output at PDC as of Mar 2025
:class: dropdown

> ```console
> $ module spider julia
> -------------------------------------------------------------------------------------------------------
>   julia:
> -------------------------------------------------------------------------------------------------------
>     Description:
>       Julia is a high-level general-purpose dynamic programming language that was originally designed
>       to address the needs of high-performance numerical analysis and computational science, without
>       the typical need of separate compilation to be fast, also usable for client and server web use,
>       low-level systems programming or as a specification language (wikipedia.org). Julia provides
>       ease and expressiveness for high-level numerical computing, in the same way as languages such as
>       R, MATLAB, and Python, but also supports general programming. To achieve this, Julia builds upon
>       the lineage of mathematical programming languages, but also borrows much from popular dynamic
>       languages, including Lisp, Perl, Python, Lua, and Ruby (julialang.org).
>
>      Versions:
>         julia/1.8.2-cpeGNU-22.06
>         julia/1.9.3-cpeGNU-22.06
>         julia/1.9.3-cpeGNU-23.03
>         julia/1.10.2-cpeGNU-23.03
>         julia/1.10.2-cpeGNU-23.12
>      Other possible modules matches:
>         Julia  libuv-julia
>
> -------------------------------------------------------------------------------------------------------
>   To find other possible module matches execute:
>
>       $ module -r spider '.*julia.*'
>
> -------------------------------------------------------------------------------------------------------
>   For detailed information about a specific "julia" package (including how to load the modules) use the module's full name.
> ```
:::

```{eval-rst}
.. challenge:: 1c. Which method to trust?

   .. solution:: Solution
      :class: dropdown

      Looking for modules in a session on the cluster is closer to the truth

```

```{eval-rst}
.. challenge:: 2. Try to start julia without having loaded julia module

   - If you have a ``julia`` module loaded already, you may unload it with the ``unload`` command.

       - **Tip:** Type: ``unload julia`` and press ``<tab>`` until the full module name is shown, then press ``<enter>``. (If the Julia module starts with an uppercase, use that instead!)

   .. solution:: Solution
      :class: dropdown

      .. code-block:: console

         $ julia

```

```{eval-rst}
.. challenge:: 3.  Load and start ``julia`` from the command line

   .. solution:: Solution
      :class: dropdown

      .. tabs::

         .. tab:: UPPMAX

            Go back and check which Julia modules were available. To load version 1.8.5, do:

            .. code-block:: console

              $ module load julia/1.8.5

            Note: Lowercase ``j``.

            For short, you can also use:

            .. code-block:: console

               $ ml julia/1.8.5

         .. tab:: HPC2N

            .. code-block:: console

               $ module load Julia/1.8.5-linux-x86_64

            Note: Uppercase ``J``.

            For short, you can also use:

            .. code-block:: console

               $ ml Julia/1.8.5-linux-x86_64

         .. tab:: LUNARC

            .. code-block:: console

               $ module load Julia/1.8.5-linux-x86_64

            Note: Uppercase ``J``.

            For short, you can also use:

            .. code-block:: console

               $ ml Julia/1.8.5-linux-x86_64

         .. tab:: NSC

            .. code-block:: console

               $ module load julia/1.10.2-bdist

            Note: lowercase ``j``.

            For short, you can also use:

            .. code-block:: console

               $ ml julia/1.10.2-bdist

         .. tab:: PDC

            .. code-block:: console

               $ module load PDC/23.12 julia/1.10.2-cpeGNU-23.12

            Note: lowercase ``j``.

            For short, you can also use:

            .. code-block:: console

               $ ml PDC/23.12 julia/1.10.2-cpeGNU-23.12
```

```{eval-rst}
.. challenge:: 4. Getting familiar with Julia REPL

    - It is important that you know how to navigate on the Julia command line. Here is where you work live with data and test aout things and you may install packages.
    - This exercise will help you to become more familiar with the REPL. Do the following steps:

       * Start a Julia session. In the ``Julian`` mode, compute the sum the numbers
         5 and 6
       * Change to the ``shell`` mode and display the current directory
       * Now, go to the ``package`` mode and list the currently installed packages
       * Finally, display help information of the function ``println`` in ``help`` mode.

   .. solution:: Solution
      :class: dropdown

       .. code-block:: julia

            $ julia
            julia> 5 + 6
            julia>;
            shell> pwd
            julia>]
            pkg> status
            julia>?
            help?> println
```

```{eval-rst}
.. challenge:: 5. Load another module and run a script

    - Load the latest version and run
    - Run the following serial script (``serial-sum.jl``) which accepts two integer arguments as input:

            .. code-block:: julia

                x = parse( Int32, ARGS[1] )
                y = parse( Int32, ARGS[2] )
                summ = x + y
                println("The sum of the two numbers is ", summ)

   .. solution:: Solution for HPC2N
      :class: dropdown


      .. code-block:: console

            $ ml purge  > /dev/null 2>&1       # recommended purge
            $ ml Julia/1.8.5-linux-x86_64      # Julia module

            $ julia serial-sum.jl Arg1 Arg2    # run the serial script

   .. solution:: Solution for UPPMAX
      :class: dropdown

      This batch script is for UPPMAX. Adding the numbers 2 and 3. (FIX)

      .. code-block:: console

            $ ml julia/1.8.5                   # Julia module

            julia serial-sum.jl Arg1 Arg2      # run the serial script


   .. solution:: Solution for LUNARC
      :class: dropdown

      This batch script is for UPPMAX. Adding the numbers 2 and 3. (FIX)

      .. code-block:: console

            $ ml Julia/1.8.5-linux-x86_64           # Julia module

            julia serial-sum.jl Arg1 Arg2      # run the serial script

   .. solution:: Solution for NSC
      :class: dropdown

      This batch script is for UPPMAX. Adding the numbers 2 and 3. (FIX)

      .. code-block:: console

            $ ml julia/1.10.2-bdist           # Julia module

            julia serial-sum.jl Arg1 Arg2      # run the serial script

   .. solution:: Solution for PDC
      :class: dropdown

      This batch script is for UPPMAX. Adding the numbers 2 and 3. (FIX)

      .. code-block:: console

            $ ml PDC/23.12 julia/1.10.2-cpeGNU-23.12           # Julia module

            julia serial-sum.jl Arg1 Arg2      # run the serial script

```

```{eval-rst}
.. challenge:: 6. Check your understanding

   - Check your understanding and answer in the shared document
   - Can you start Julia without loading a Julia module?

       - Yes?
       - No?

   - Which character to use to toggle

       - to the ``package`` mode?
       - back to the ``Julia`` mode?
       - to the ``help`` mode?
       - to the ``shell`` mode?
```

```{eval-rst}
.. keypoints::

   - Before you can run Julia scripts or work in a Julia shell, first load a Julia module with ``module load <julia module>``
   - Start a Julia shell session with ``julia``
   - It offers several modes that can make your workflow easier, i.e.

       - ``Julian``
       - ``shell``
       - ``package manager``
       - ``help``

   - Run scripts with ``julia <script.jl>``
```
