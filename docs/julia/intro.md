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

    - Find best practices for using Julia at Swedish academic clusters
    - Get the hang of packages functioning
    - Use the HPC performance with Julia

    **Not covered**

    - Improve Julia *coding* skills
    - Other clusters
    
## Why it was created

Quoting from the [2012 blogpost](https://julialang.org/blog/2012/02/why-we-created-julia/)
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
close as possible for a certain set of users. If the work you do falls in the
categories mentioned, as HPC work does, this target audience includes you.


## Reasons to choose Julia

The strengths of Julia are based on flexibility. Moreso than forcing either your
code or your workflow into anything, it enables you to choose the right way to
write or work for the task at hand.

- Special compilation model
    - Enables interactive use and development without the drawbacks of
      interpreted languages
- Special type system
    - Hierarchical, deep, types can be defined as precisely or loosely as makes
      sense for each situation
    - This (along with multiple dispatch and the compilation model) enables not
      only great flexibility but also great composability
- Built for numerical computing, but works well also for general tasks
- Built-in powerful package management (based on Git) with efficient
  per-project environments, very good for reproducibility

Finally, the built-in or integrated documentation tools are good enough that
many Julia packages have relatively good documentation.

In addition to the strengths of the core language, a few standout packages that
you may want to make use of:

- [Pluto](https://plutojl.org): Reproducible (even without Pluto), gittable,
  extraordinarily interactive programming notebooks
- [Flux](https://fluxml.ai): Machine learning stack based on differentiable
  programming, which Julia does especially well
- [DifferentialEquations](https://github.com/SciML/DifferentialEquations.jl),
  which is especially state-of-the-art, or other components from the large
  [SciML](https://docs.sciml.ai/Overview/stable/) toolkit for ML in scientific
  computing
- [JuMP](https://jump.dev), a modeling language and toolkit for mathematical
  optimization



## Reasons to choose something else

An interpreted language (such as R or MATLAB) will execute your instructions
immediately, without compilation. If your code changes and recompiles a lot in
relation to the time spent running the code and the computations, this will give
you a better interactive experience and save CPU time.

For really large projects, the structure and consistency enforced by a more
rigid language such as Java can be an important benefit.

As always, it may be faster to use a tool you already know well than to use a
tool that you have not learned yet.

There are some cases where existing tools are best used from their own
environments (often the case for graphical tools), but in general the Julia
solutions for using packages and libraries from other languages (R, MATLAB,
Python, Fortran, C) are very useful.


!!! info "Questions?"
    - What are your first impressions, what do you hope that Julia can solve for
      you?
    - Which tools do you need to find to start using Julia?
    - What do you need to learn from us, and what can you easily learn from
      online resources?


## More on Julia

Almost everything you could ask for can be found from or on the official website
<https://julialang.org>. Some shortcuts:

- [Official Julia documentation](https://docs.julialang.org/en/v1/)
- [Official Julia discussion/support forum](https://discourse.julialang.org)
- Many other channels, e.g. Slack, Zulip, Discord are found [in this
  list](https://julialang.org/community/otherchannels/)
- The list of [GitHub
  organizations](https://julialang.org/community/organizations/) can be a
  starting point for finding the packages relevant to your field

And a few other extra resources:

- A big list of [AI tools](https://github.com/svilupp/awesome-generative-ai-meets-julia-language)
- [HPC2N YouTube video on Julia in HPC](https://www.youtube.com/watch?v=bXHe7Kj3Xxg)
- [Extra materials in these course pages](https://uppmax.github.io/R-matlab-julia-HPC/extra/julia_extra.html)


## Julia documentation at the centers

- [UPPMAX](http://docs.uppmax.uu.se/software/julia/)
- [HPC2N](https://www.hpc2n.umu.se/resources/software/julia)
- LUNARC has no specific Julia documentation, but here you can find [installed versions](https://lunarc-documentation.readthedocs.io/en/latest/software/installed_software/)
- [NSC](https://www.nsc.liu.se/software/installed/tetralith/julia/)
- [PDC](https://support.pdc.kth.se/doc/applications/julia/)

