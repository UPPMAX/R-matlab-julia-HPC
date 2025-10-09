# Parallel computation

!!! info "Learning outcomes"

    - I can name and describe 3 types of parallel computation
    - I can explain at least 1 advantage of parallel computation
    - I can explain at least 2 disadvantages of parallel computation
    - I can explain how to use my computational resources effectively

???- note "For teachers"

    Teaching goals are:

    - Learners have scheduled and run a job that needs more cores,
      with a calculation in their favorite language
    - Learners understand when it is possible/impossible
      and/or useful/useless to run a job with multiple cores

    Lesson plan:

    - 10 mins: Prior
    - 5 mins: Present
    - 15 mins: Challenge
    - 15 mins: Feedback

    Prior:

    - What is parallel computing?
    - When to use parallel computing

    Feedback:

    - When to use parallel computing?
    - When not to use parallel computing?
    - The main section is called 'The ideal effectiveness of parallelism'.
      What does 'ideal' mean in this context?
      What could make parallelism less ideal?

???- hint "Prefer this session as a video?"

    The watch the YouTube video
    [R-Julia-MATLAB course, advanced day: Parallel computation](https://youtu.be/3OTMgBche74)

![CoRA, the robotic platform for Arnold](cora.jpg)

> Figure 1: CoRA, a robotic platform in which all computers
> (e.g. the one connected to the camera, another connected to the gripper, etc)
> sent messages to one receiving computer:
> an example of distributed parallelism

## Why parallel computing is important

Most HPC clusters use 7-10 days as a maximum duration for a job.
Your calculation may take longer than that.
One technique that may work is to use parallel computing,
where one uses multiple CPU cores to work together on a same calculation

## HPC cluster architecture

Here is a simplified picture of HPC cluster architecture:

```mermaid
flowchart TD
  subgraph hpc_cluster[HPC cluster]
    subgraph node_1[Node 1]
      subgraph cpu_1_1[CPU 1]
      core_1_1_1[Core 1]
      end
    end
  end
```

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

Term        |What it loosely is                              |Amount
------------|------------------------------------------------|---------------
Core        |Something that does a calculation               |One or more per CPU
CPU         |A collection of cores that share the same memory|One or more per node
Node        |A collection of CPUs that share the same memory |One or more per HPC cluster
HPC cluster |A collection of nodes                           |One or more per universe
The universe|A collection of HPC clusters                    |One <!-- yes, I think this is funny :-) -->

<!-- markdownlint-enable MD013 -->


## Types of 'doing more things at the same time'

There are many types of 'doing more things at the same time'.
One way to distinguish these, is to separate these on
the extent of the parallelism:

Extent       |Parallelism
-------------|--------------------------------------
Core         |Single-threaded (you already do this)
Node         |Thread parallelism (this session)
HPC cluster  |Distributed parallelism (next session)
The universe |Distributed parallelism

Today, we will extend your toolkit from a single-threaded
calculation (you already do this) to thread parallelism.

## The ideal effectiveness of parallelism

Before going into details, we will look at the
effectiveness of parallelism in the most optimal case,
with the goal that you can determine if it is worth it.

By now, you can probably guess that parallel computing spreads
a calculation over multiple things that can calculate.

Imagine a calculation that takes 16 time units, represented as this:

![1 core](amdahls_law_example_1.png)

> Figure 2: a calculation of 16 time units run on 1 core,
> following the legend below:

Square                | A unit of calculation time that ...
----------------------|------------------------------------
:red_square:          | cannot be run in parallel
:green_square:        | can be run in parallel
:white_medium_square: | is spent doing nothing

Using 2 calculation units, this results in:

![2 cores](amdahls_law_example_2.png)

> Figure 2: a calculation of 16 time units run on 2 cores,
> where square is a time unit of calculation.

This takes the calculation down from 16 to 10 time units.
The so-called 'speedup' of using two workers is 16 / 10 = 1.6.

??? hint "How did you calculate the speedup exactly?"

    Following `[Hennessy and Patterson, 2011]` (section 1.8),
    the speedup `n` (as in the sentence 'X is `n` times faster than Y')
    equals:

    ```text
    n = t_y / t_x
    ```

    where:

    - `t_x` is the time the new/enhanced process takes
    - `t_y` is the time the regular/unenhanced process takes

    In this context, the
    'new/enhanced process' is the calculation performed by multiple cores.

    Do not be confused by another version of Amdahl's Law,
    that is expressed and the calculation units used (and where the
    numerator and denominator are swapped):

    ```text
    n =  performance_x / performance_y
    ```

    where:

    - `performance_x` is the performance (e.g. tasks completed per time unit)
      the new/enhanced process does
    - `performance_y` is the performance of the regular process


??? hint "Isn't that Gustafson's Law?"

    Not directly.

    We do use the same term 'speedup' as is calculated in Gustafson's Law,
    yet we apply it to compare between a single-core and a multi-core
    process.

    Gustafson's Law predict the maximum speedup, which is

    ```text
    S = s + (p * N) = N - ((N - 1) * s) = 1 + ((N - 1) * p)
    ```

    - `S` is the speedup
    - `s` is fraction of the calculation that cannot be parallelized. The 's' stands 'serial'
    - `p` is fraction of the calculation that can be parallelized
    - `N` is the number of workers, in our case: cores

However, 4 (out of 20) calculations units are spent waiting.
This means that 16 / 20 = 80% of the calculation time
is spent efficiently.

??? hint "How did you calculate the efficiency exactly?"

    The efficiency, `f`, equals:

    ```text
    f = t_used_effectively / t_total`
    ```

    where:

    - `t_used_effectively` is the time spend on a calculation,
      summed up over all cores
    - `t_total` is the total time all spent by all cores

    These two can be calculated as such:

    ```text
    t_used_effectively = (p + s) + (p * (N - 1))
    t_total = time * N
    ```

    where:

    - `s` is fraction of the calculation that cannot be parallelized. The
      's' stands 'serial'
    - `p` is fraction of the calculation that can be parallelized
    - `N` is the number of workers, in our case: cores


Here one can see this calculation for more cores:

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

Program runtime                      |Number of cores|Time|Speedup       |Efficiency
-------------------------------------|---------------|----|--------------|-----------------------------------------------
![1 core](amdahls_law_example_1.png) |1              |16  |16 / 16 = 100%|16 / 16 = 100%
![2 cores](amdahls_law_example_2.png)|2              |10  |16 / 10 = 160%|(10 + 6) / (10 * 2) = 16 / 20 = 80%
![3 cores](amdahls_law_example_3.png)|3              |8   |16 / 8 = 200% |(10 + 6 + 6) / (10 * 3) = 22 / 30 = 73%
![4 cores](amdahls_law_example_4.png)|4              |7   |16 / 7 = 229% |(10 + 6 + 6 + 6) / (10 * 4) = 28 / 40 = 70%
![6 cores](amdahls_law_example_6.png)|6              |6   |16 / 6 = 267% |(10 + 6 + 6 + 6 + 6) / (10 * 5) = 34 / 50 = 68%

<!-- markdownlint-enable MD013 -->

The best possible speed gain (as shown here) is called Amdahl's Law
(inspired by `[Amdahl, 1967]`)
and, in a general form, is plotted like this:

![Amdahl's law](amdahls_law.png)

<!-- Note that this was not the plot as in the original paper -->

## Exercises

## Question 1

Which of the lines in the graph of Amdahl's Law corresponds
with the worked-out example of 16 time units?

??? tip "Answer"

    The red dotted line.

    Using a different unit (i.e. 'relative speed', instead of 'speedup')
    was done on purpose. It is easy to convert between the two: just
    take the inverse (i.e. divide 1 by the value you have)

## Question 2

In the example of 16 time units, what is the shortest amount of time that
can be spent on the calculation, given infinite resources?

??? tip "Answer"

    The length of the calculation that cannot be run in parallel,
    which is 4 time units.

## Question 3

In the example of 16 time units, what is the maximal possible speedup?

??? tip "Answer"

    400%, as the calculation takes 16 units of work on a single core,
    and 4 time units on an infinite amount of cores.

    In mathematical form, the speedup, `S`, equals:

    ```text
    S = t_regular / t_enhanced
    S = 16 / 4
    S = 4
    S = 400%
    ```
    
    where:

    - `t_enhanced` is the time the enhanced process takes
    - `t_regular` is the time the regular/unenhanced process takes

## Question 4

For your research project, you need to run a lot of calculations.
Each calculation takes 10 hours. How do you make optimal use
of your computational resources?

??? tip "Answer"

    Run the calculation on a single core for 100% efficiency

## Question 5

For your research project, you also have a calculation that takes 11 days.
Your HPC cluster allows a calculation of at most 10 days.
Assume your HPC center will not extend your job (they will sometimes do so when asked!).
How do you make optimal use of your time?

??? tip "Answer"

    If your calculation already has parallelism built-in,
    then run the calculation on two cores: this only involves changing your
    Slurm script, with a low loss of computational resources.

    If you are a really tight on computational resources, you can
    implement a 'save state' in your calculation, so that you can schedule
    two runs of nine days in succession, each with 100% efficiency.

    Alternatively, you can added thread parallelism to allow running
    with multiple cores.

## Question 6

Your colleague runs many jobs with a lot of cores. 'It is way faster!',
he/she states. That same colleague, however, also complains about long
waiting times before his/her jobs start. How would you explain this
situation?

??? tip "Answer"

    The colleague used up (or: 'wasted') all his/her computational resources
    (commonly 10,000 core hours per month on UPPMAX).

    Due to this, his/her jobs are only run when the HPC cluster has a low workload and activates the so-called 'bonus queue' (UPPMAX) or generally have to wait for their priority to go up again.

## Question 7

Your colleague has also done the exercises in this session
and decided to measure the same features of her code.
Below you can see the plots produced by this benchmark.
What seemed to be the percentage of his/her code
that could be run in parallel?

=== "Total core seconds"

    ![Benchmark core seconds](benchmark_results_core_seconds.png)

    > Benchmark: the total core seconds per number of workers

=== "Efficiency"

    ![Benchmark efficiency](benchmark_results_efficiency.png)

    > Benchmark: Efficiency per number of workers

=== "Speedup"

    ![Benchmark speedup](benchmark_results_speedup.png)

    > Benchmark: Speedup per number of workers

??? tip "Answer"

    It is **unknown** what portion of the code can be run in parallel.

    Instead, this benchmark shows how it looks if code is run in single-thread
    mode. In this case, the colleague forgot that the number of threads used
    must be specified when calling Julia.

    Note that these plots are less clear than you may have expected:

    - The total core seconds is expected to increase linearily
    - The efficiency is expected to follow the dashed line
    - The speedup is expected to be at 100%

    It may be unexpected that also in computer science,
    results can be messier than you would expect :-)


The first characteristic of interest is the fraction
of the computational load which is associated with
data management housekeeping. This fraction has
been very nearly constant for about ten years, and
accounts for 40% of the executed instructions in
production runs.

## References

- `[Amdahl, 1967]` Amdahl, Gene M. 
  "Validity of the single processor approach to achieving large scale
  computing capabilities." Proceedings of the April 18-20, 1967,
  spring joint computer conference. 1967.
  Fun facts: it contains a single hand-drawn plot and no equations
- `[Hennessy and Patterson, 2011]` Hennessy, John L., and David A. Patterson.
  Computer architecture: a quantitative approach. Elsevier, 2011.
