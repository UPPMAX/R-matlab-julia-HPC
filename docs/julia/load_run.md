# Load and run Julia

!!! info

    At the Swedish HPC centers we call the applications available via the *module system* **modules**:

    - [NSC](https://www.nsc.liu.se/software/modules/)
    - [PDC](https://support.pdc.kth.se/doc/contact/contact_support/?sub=software/module/)
    - [UPPMAX](https://docs.uppmax.uu.se/cluster_guides/modules/)
    - [HPC2N](https://docs.hpc2n.umu.se/software/modules/)
    - [LUNARC](https://lunarc-documentation.readthedocs.io/en/latest/manual/manual_modules/#hierarchical-naming-scheme-concept)


!!! info "Objectives"

    - Learn to load Julia
    - Get started with the Julia command line
    - Learn to run Julia scripts

??? note "Instructor note"

    - Lecture and demo 15 min
    - Exercise 15 min
    - Total time 30 min

Julia can be started after a Julia module is loaded.
The module activates paths to a specific version of the julia interpreter and its libraries and packages.

??? note "Short cheat sheet"

    - See which modules exists: ``module spider`` or ``ml spider``.
    - Find module versions for a particular software: ``module spider <software>``
    - Modules depending only on what is currently loaded: ``module avail`` or ``ml av``
    - See which modules are currently loaded: ``module list`` or ``ml``
    - Load a module: ``module load <module>/<version>`` or ``ml <module>/<version>``
    - Unload a module: ``module unload <module>/<version>`` or ``ml -<module>/<version>``
    - Unload all modules except the 'sticky' modules: ``module purge`` or ``ml purge``

!!! warning
    Note that the module systems at UPPMAX and HPC2N are slightly different.
    All modules at UPPMAX, for instance, not directly related to bio-informatics are shown by ``ml avail``.

    Modules at many other centres are only available when one has loaded all
    prerequisites, for instance the compilers (``GNU``, ``Intel``, etc.).


## Check for Julia versions

!!! info "Long-term support versions"

    So far Julia has Long-term support (LTS) for

    - 1.6.7 
    - 1.10.X (high X is better)

    It might good to try to stick with such a version for future compatibility and support.

### Principle

- For some clusters

``` { .console data-copy="module avail julia" }
module avail julia
```

??? note "Example output"

    From Tetralith:

    ``` { .console data-copy="module avail julia" }
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


- Or, at clusters that hides the modules until relevant dependencies are loaded (HPC2N & PDC)

``` { .console data-copy="module spider julia" }
module spider julia
```

??? note "Example output"

    From Dardel:
    
    ``` { .console data-copy="module spider julia" }
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

## Load a Julia module

For reproducibility, we recommend ALWAYS loading a specific module for the Julia version instead of using the
default one.

#### Principle

- Use the output of existing module above!
- Load the module!

At some clusters:

``` { .console }
module load julia/1.8.5
```

or at cluster that includes "architecture" or "build name" in module name:

``` { .console }
ml julia/1.10.2-bdist
```

Some clusters will require other modules to be loaded (Kebnekaise and Dardel)

- First check how to load (see Check for Julia versions above)

``` { .console data-copy="module spider julia/1.10.2-cpeGNU-23.12" }
$ module spider julia/1.10.2-cpeGNU-23.12

...
You will need to load all module(s) on any one of the lines below before the "julia/1.10.2-cpeGNU-23.12" module is available to load.

PDC/23.12
```

- Load PDC/23.12 first and then the julia module

``` { .console }
ml PDC/23.12 julia/1.10.2-cpeGNU-23.12
```

## Run

### Run Julia as a session

- After loading the appropriate modules for Julia, you will have access to the **read-eval-print-loop (REPL)** command line by typing ``julia``:

``` { .console }
julia
```

- In julia REPL

!!! Example
    This is what loading the Julia REPL looks like on Pelle:

    ``` { .console }
    [username@pelle1 ~]$ ml
    No modules loaded
    [username@pelle1 ~]$ ml Julia/1.10.9
    [username@pelle1 ~]$ ml

    Currently Loaded Modules:
      1) Julia/1.10.9-LTS-linux-x86_64

     

    [username@pelle1 ~]$ julia
               _
       _       _ _(_)_     |  Documentation: https://docs.julialang.org
      (_)     | (_) (_)    |
       _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
      | | | | | | |/ _` |  |
      | | |_| | | | (_| |  |  Version 1.10.9 (2025-03-10)
     _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
    |__/                   |

    julia> 

    ```

### Modes: Julian mode

- Julia has different modes, the one we arrive at is the so-called ``Julian`` mode, where one can execute commands.
- The description for accessing these modes will be given in the following paragraphs.
- Once you are done with your work in any of the modes, you can return to the ``Julian`` mode by pressing the ``backspace`` key.

### Shell mode

While being on the Julian mode you can enter the ``shell`` mode by typing ``;``:

``` { .julia-repl }
   julia>;
   shell>pwd
   /current-folder-path
```

this will allow you to use Linux commands. Notice that the availability of these commands
depend on the OS, for instance, on Windows it will depend on the terminal that you have
installed and if it is visible to the Julia installation.

### Package manager mode

Another mode available in Julia is the ``package manager`` mode, it can be accessed by typing
``]`` in the ``Julian`` mode:

``` { .julia-repl }

   julia>]
   (v1.8) pkg>
```

this will make your interaction with the package manager **Pkg** easier, for instance,
instead of typing the complete name of **Pkg** commands such as ``Pkg.status()`` in the
``Julian`` mode, you can just type ``status`` in the ``package`` mode.

### Help mode

The last mode is the ``help`` mode, you can enter this mode from the ``Julian`` one by
typing ``?``, then you may type some string from which you need more information:

``` { .julia}

   julia>?

   help?> ans
   search: ans transpose transcode contains expanduser instances MathConstants readlines
   LinearIndices leading_ones leading_zeros

   ans

   A variable referring to the last computed value, automatically set at the interactive prompt.
```

### Exiting

Exit with

``` { .julia-repl }

   julia> <Ctrl-D>
```

or

``` { .julia-repl }

   julia> exit()
```

!!! note "The Julian modes summary"

    - enter the *shell mode* by typing ``;``
    - go back to *Julian* mode by ``<backspace>``
    - access the *package manager* mode by typing ``]`` in the *Julian* mode
    - use the *help mode* by typing ``?`` in the *Julian mode*

!!! note "See also"

    [More detailed information about the modes in Julia can be found](https://docs.julialang.org/en/v1/stdlib/REPL).


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

!!! example "Challenge 1a. Find out which versions are on your cluster from documentation"

    - Find/search for that documentation!

    ??? note "Solutions"

        - [UPPMAX](http://docs.uppmax.uu.se/software/julia/)
        - [HPC2N](https://www.hpc2n.umu.se/resources/software/julia)
        - [LUNARC](The user demand on Julia has been low, so there is currently no site-specific documentation.)
        - [NSC](https://www.nsc.liu.se/software/installed/tetralith/julia/)
        - [PDC](https://support.pdc.kth.se/doc/applications/)

!!! example "Challenge 1b. Find out which versions are on your cluster from command line"

    - Use the ``spider`` or ``avail`` module commands

    ??? note "Solutions"

        === "UPPMAX"

            Check all available Julia versions with:

            ```console

                $ module avail julia
            ```

        === "HPC2N"

            Check all available version Julia versions with:

            ```console

               $ module spider julia
            ```

            Notice that the output if you are working on the Intel (*kebnekaise.hpc2n.umu.se*) or AMD
            (*kebnekaise-amd.hpc2n.umu.se*) login nodes is different. In the former, you will see more
            installed versions of Julia as this hardware is older.

            To see how to load a specific version of Julia, including the prerequisites, do

            ```console

               $ module spider Julia/<version>
            ```

            Example for Julia 1.8.5

            ```console

               $ module spider Julia/1.8.5-linux-x86_64
            ```

        === "LUNARC"

            Check all available version Julia versions with:

            ```console

               $ module spider Julia
            ```

            To see how to load a specific version of Julia, including the prerequisites, do

            ```console

               $ module spider Julia/<version>
            ```

            Example for Julia 1.8.5

            ```console

               $ module spider Julia/1.8.5-linux-x86_64
            ```

        === "Tetralith"

            Check all available version Julia versions with:

            ```console

               $ module avail Julia
            ```

            Example for Julia 1.8.5

            ```console

               $ module spider julia/1.8.5-nsc1-bdist
            ```

        === "Dardel"

            Check all available version Julia versions with:

            ```console

               $ module spider Julia
            ```

            To see how to load a specific version of Julia, including the prerequisites, do

            ```console

               $ module spider Julia/<version>
            ```

            Example for Julia 1.8.5

            ```console

               $ module spider Julia/1.8.5-linux-x86_64
            ```
               
    ??? note "Output at UPPMAX as of Oct 2025"

        Rackham/(Bianca)

        ``` console

          $ module avail julia
          ----------------------------- /sw/mf/rackham/compilers -----------------------------
             julia/1.0.5_LTS    julia/1.6.1        julia/1.7.2    julia/1.9.3
             julia/1.1.1        julia/1.6.3        julia/1.8.5    julia/1.10.10_LTS
             julia/1.4.2        julia/1.6.7_LTS    julia/1.9.1    julia/1.11.6      (D)

           Where:
            D:  Default Module

          Use "module spider" to find all possible modules and extensions.
          Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".
        ```

        Pelle 

        ``` console

        $ ml av Julia

        ---------------------------------------------------- /sw/arch/eb/modules/all --------------------
           Julia/1.10.9-LTS-linux-x86_64    Julia/1.11.3-linux-x86_64 (D)

          Where:
           D:  Default Module

        If the avail list is too long consider trying:

        "module --default avail" or "ml -d av" to just list the default modules.
        "module overview" or "ml ov" to display the number of modules for each name.
        
        Use "module spider" to find all possible modules and extensions.
        Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".
        ```

    ??? note "Output at HPC2N as of Oct 2025"

        ```console

           $ module spider julia  # Assuming you are working on the Intel login nodes
           ------------------------------------------------------------------------------------------------
             Julia:
           ------------------------------------------------------------------------------------------------
             Description:
               Julia is a high-level, high-performance dynamic programming language for numerical
               computing

             Versions:
                Julia/1.5.3-linux-x86_64
                Julia/1.7.1-linux-x86_64
                Julia/1.8.5-linux-x86_64
                Julia/1.9.3-linux-x86_64
           ------------------------------------------------------------------------------------------------
             For detailed information about a specific "Julia" package (including how to load the modules) use the module's full name.
             Note that names that have a trailing (E) are extensions provided by other modules.
             For example:

                $ module spider Julia/1.8.5-linux-x86_64
           ------------------------------------------------------------------------------------------------
        ```

    ??? note "Output at LUNARC as of Oct 2024"

        ```console

           $ module spider julia
           -----------------------------------------------------------------------------------------------------
             Julia:
           -----------------------------------------------------------------------------------------------------
               Description:
                 Julia is a high-level, high-performance dynamic programming language for numerical computing

                Versions:
                   Julia/1.8.5-linux-x86_64
                   Julia/1.9.0-linux-x86_64
                   Julia/1.9.2-linux-x86_64
                   Julia/1.9.3-linux-x86_64
                   Julia/1.10.4-linux-x86_64
        ```

    ??? note "Output at NSC as of Mar 2025"

        ```console

           $ module avail julia

           ---------------------------------- /software/sse2/tetralith_el9/modules -----------------------------------
              julia/recommendation          (D)    julia/1.6.1-nsc1-bdist    julia/1.9.4-bdist
              julia/1.1.0-nsc1-gcc-2018a-eb        julia/1.7.2-nsc1-bdist    julia/1.10.2-bdist
              julia/1.4.1                          julia/1.8.5-nsc1-bdist
        ```

    ??? note "Output at PDC as of Oct 2025"

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
                   julia/1.11.4-cpeAMD-24.11
                Other possible modules matches:
                   Julia  libuv-julia

           -------------------------------------------------------------------------------------------------------
             To find other possible module matches execute:

                 $ module -r spider '.*julia.*'

           -------------------------------------------------------------------------------------------------------
             For detailed information about a specific "julia" package (including how to load the modules) use the module's full name.
        ```


!!! example "Challenge 1c. Which method to trust?"

    Shall one trust the documentation or the commandline on the cluster more?
    
    ??? note "Solution"

        Looking for modules in a session on the cluster is closer to the truth


!!! example "Challenge 2. Try to start julia without having loaded julia module"

    - If you have a ``julia`` module loaded already, you may unload it with the ``unload`` command.

    - **Tip:** Type: ``unload julia`` and press ``<tab>`` until the full module name is shown, then press ``<enter>``. (If the Julia module starts with an uppercase, use that instead!)

    ??? note "Solution"

        ```console

         $ julia
        ```

        It doesn't work! The Julia interpreter is not found.

!!! example "Challenge 3.  Load and start ``julia`` the right way from the command line"

    ??? note "Solution"

        === "UPPMAX"

            Rackham/Bianca
            
            Go back and check which Julia modules were available. To load version 1.8.5, do:

            ```console

              $ module load julia/1.8.5
            ```
 
            Note: Lowercase ``j``.

            For short, you can also use:

            ```console

               $ ml julia/1.8.5
            ```

            Pelle
            
            Go back and check which Julia modules were available. To load version 1.10.6, do:

            ```console

              $ module load Julia/1.10.9-LTS-linux-x86_64
            ```
            Note: Uppercase ``j``.

            For short, you can also use:

            ```console

               $ ml Julia/1.10.9-LTS-linux-x86_64
            ```

        === "HPC2N"

            ```console

               $ module load Julia/1.8.5-linux-x86_64

            Note: Uppercase ``J``.

            For short, you can also use:

            ```console

               $ ml Julia/1.8.5-linux-x86_64
            ```

        === "LUNARC"

            ```console

               $ module load Julia/1.8.5-linux-x86_64
            ```

            Note: Uppercase ``J``.

            For short, you can also use:

            ```console

               $ ml Julia/1.8.5-linux-x86_64
            ```

        === "NSC"

            ```console

               $ module load julia/1.10.2-bdist

            Note: lowercase ``j``.

            For short, you can also use:

            ```console

               $ ml julia/1.10.2-bdist
            ```

        === "PDC"

            ```console

               $ module load PDC/23.12 julia/1.10.2-cpeGNU-23.12
            ```

            Note: lowercase ``j``.

            For short, you can also use:

            ```console

               $ ml PDC/23.12 julia/1.10.2-cpeGNU-23.12
            ```
            
!!! example "Challenge 4. Getting familiar with Julia REPL"

    - It is important that you know how to navigate on the Julia command line. Here is where you work live with data and test aout things and you may install packages.
    - This exercise will help you to become more familiar with the REPL. Do the following steps:

       * Start a Julia session. In the ``Julian`` mode, compute the sum the numbers
         5 and 6
       * Change to the ``shell`` mode and display the current directory
       * Now, go to the ``package`` mode and list the currently installed packages
       * Finally, display help information of the function ``println`` in ``help`` mode.

    ??? note "Solution"

        ```julia

            $ julia
            julia> 5 + 6
            julia>;
            shell> pwd
            julia>]
            pkg> status
            julia>?
            help?> println
        ```
        
!!! example "Challenge 5. Load another module and run a script"

    - Load the latest version
    - Run the following serial script (``serial-sum.jl``) which accepts two integer arguments as input:

    ```julia

    x = parse( Int32, ARGS[1] )
    y = parse( Int32, ARGS[2] )
    summ = x + y
    println("The sum of the two numbers is ", summ)
    ```

    - Enter two numbers, like 2 & 3.
    
    ??? note "Solution for HPC2N"

        ```console

            $ ml purge  > /dev/null 2>&1       # recommended purge
            $ ml Julia/1.8.5-linux-x86_64      # Julia module

            $ julia serial-sum.jl Arg1 Arg2    # run the serial script
        ```

    ??? note "Solution for UPPMAX"

        Rackham/Bianca

        ```console

            $ ml julia/1.8.5                   # Julia module

            julia serial-sum.jl Arg1 Arg2      # run the serial script
        ```

        Pelle

        ```console

            $ ml Julia/1.10.9-LTS-linux-x86_64  # Julia module

            julia serial-sum.jl Arg1 Arg2       # run the serial script
        ```

    ??? note "Solution for LUNARC"

        ```console

            $ ml Julia/1.8.5-linux-x86_64           # Julia module

            julia serial-sum.jl Arg1 Arg2      # run the serial script
        ```
        
    ??? note "Solution for NSC"

        ```console

            $ ml julia/1.10.2-bdist           # Julia module

            julia serial-sum.jl Arg1 Arg2      # run the serial script
        ```
        
    ??? note "Solution for PDC"

        ```console

            $ ml PDC/23.12 julia/1.10.2-cpeGNU-23.12           # Julia module

            julia serial-sum.jl Arg1 Arg2      # run the serial script
        ```

!!! example "Challenge 6. Check your understanding"

    - Check your understanding and answer in the shared document
    - Can you start Julia without loading a Julia module?

        - Yes?
        - No?

    - Which character to use to toggle

        - to the ``package`` mode?
        - back to the ``Julia`` mode?
        - to the ``help`` mode?
        - to the ``shell`` mode?

    ??? note "Solution"

        - to the ``package`` mode? ``]``
        - back to the ``Julia`` mode? ``<backspace>``
        - to the ``help`` mode? ``?``
        - to the ``shell`` mode? ``;``
         

!!! summary 

    - Before you can run Julia scripts or work in a Julia shell, first load a Julia module with ``module load <julia module>``
    - Start a Julia shell session with ``julia``
    - It offers several modes that can make your workflow easier, i.e.

        - ``Julian``
        - ``shell``
        - ``package manager``
        - ``help``

    - Run scripts with ``julia <script.jl>``

