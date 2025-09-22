# Why Julia?

!!! info "Learning outcomes for today"

    - Learn how to load Julia modules and access site-installed Julia packages
    - Grasp the concept of Julia environments
    - Familiarize with Julia packages installation with `Pkg`
    - Acquire the knowledge of writing batch scripts for running Julia
    - Discover and explore the different Julia parallelization tools
    - Learn how Julia supports GPU computing
    - Gain knowledge on how to run ML jobs in Julia


!!! info "Your expectations?"

    - Find best practices for using Julia at UPPMAX and HPC2N
    - Get the hang of packages functioning
    - Use the HPC performance with Julia

    **Not covered**

    - Improve Julia *coding* skills
    - Other clusters

??? note "Instructor note"

    - Intro 5 min
    - Lecture and 10 min


## Why it was created

Quoting from the [blogpost](https://julialang.org/blog/2012/02/why-we-created-julia/)
that announced Julia to the world:

> In short, because we are greedy.

They mention Matlab, Lisp, Python, Ruby, Perl, Mathematica, R and C.

> We love all of these languages; they are wonderful and powerful. For the work
> we do — scientific computing, machine learning, data mining, large-scale
> linear algebra, distributed and parallel computing — each one is perfect for
> some aspects of the work and terrible for others. Each one is a trade-off.
>
> We are greedy: we want more.

No language can be everything for everyone, but Julia was created to get as
close as possible for a certain set of users. A little later in the short post
the creators talk again about HPC specifically:

> While we're being demanding, we want something that provides the distributed
> power of Hadoop — without the kilobytes of boilerplate Java and XML; without
> being forced to sift through gigabytes of log files on hundreds of machines
> to find our bugs. We want the power without the layers of impenetrable
> complexity. We want to write simple scalar loops that compile down to tight
> machine code using just the registers on a single CPU. We want to write A*B
> and launch a thousand computations on a thousand machines, calculating a vast
> matrix product together.


## Reasons to choose Julia

<dl>
    <dt>Fast:</dt>
    <dd>Julia was designed from the beginning for high performance. Julia
    programs compile to efficient native code for multiple platforms via
    LLVM.</dd>

    <dt>General:</dt>
    <dd>It uses multiple dispatch as a paradigm, making it easy to express many
    object-oriented and functional programming patterns. The standard library
    provides asynchronous I/O, process control, logging, profiling, a package
    manager, and more. </dd>

    <dt>Dynamic:</dt>
    <dd>Julia is dynamically-typed, feels like a scripting language, and has
    good support for interactive use. </dd>

    <dt>Technical:</dt>
    <dd>It excels at numerical computing with a syntax that is great for math,
    many supported numeric data types, and parallelism out of the box. Julia's
    multiple dispatch is a natural fit for defining number and array-like data
    types. </dd>

    <dt>Optionally typed:</dt>
    <dd>Julia has a rich language of descriptive data types, and type
    declarations can be used to clarify and solidify programs. </dd>

    <dt>Composable:</dt>
    <dd>Julia’s packages naturally work well together. Matrices of unit
    quantities, or data table columns of currencies and colors, just work — and
    with good performance. </dd>
</dl>

- Special compilation model
    - Enables interactive use and development without the drawbacks of
      interpreted languages
- Special type system
    - Hierarchical, deep, types can be defined as precisely or loosely as makes
      sense for the situation at hand
    - This (along with multiple dispatch and the compilation model) enables not
      only great flexibility but also great composability
- Built for numerical computing
- Built-in powerful package management (based on Git) with efficient
  per-project environments, very good for reproducibility
- Pluto
    - Reproducible (even without Pluto), gittable, extraordinarily interactive
      programming notebooks
- 

## Reasons to choose something else

## More on Julia

- Official Julia documentation is found
  [here](https://docs.julialang.org/en/v1/)
- Official Julia discussion/support forum is
  [here](https://discourse.julialang.org)
- Slack channel for Julia and instructions for joining it are found here:
  <https://julialang.org/slack/>
- [HPC2N YouTube video on Julia in HPC](https://www.youtube.com/watch?v=bXHe7Kj3Xxg)
- [Extra materials in these course pages](https://uppmax.github.io/R-matlab-julia-HPC/extra/julia_extra.html)

## Julia documentation at the centers

- [UPPMAX](http://docs.uppmax.uu.se/software/julia/)
- [HPC2N](https://www.hpc2n.umu.se/resources/software/julia)
- LUNARC has no specific Julia documentation, but you can find installed versions
[here](https://lunarc-documentation.readthedocs.io/en/latest/software/installed_software/)
- [NSC](https://www.nsc.liu.se/software/installed/tetralith/julia/)
- [PDC](https://support.pdc.kth.se/doc/applications/julia/)



!!! info "Key points:"

    - Julia is a relatively new language with several attractive features.
    - Julia purpose is to avoid changing between high performance and high productivity languages
      in the different phases of code development.

