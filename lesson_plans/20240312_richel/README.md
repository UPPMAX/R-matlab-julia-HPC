# Lesson plan

* Teaching date: 2024-04-12
* Course: Python
* Teacher: Richel

Remote desktop websites:

* HPC2N: kebnekaise-tl.hpc2n.umu.se
* UPPMAX: rackham-gui.uppmax.uu.se

Compute allocations:

* Rackham: `naiss2024-22-107`
* Kebnekaise: `hpc2n2024-025`
* Mine: `uppmax2023-2-25`

Storage space:

* Rackham: `/proj/r-py-jl`
* Kebnekaise: `/proj/nobackup/hpc2n2024-025`
* Mine: `/proj/staff`

### Python (Tuesday 2024-03-12)

Time     |Topic                      |Teacher
---------|---------------------------|-------
**9.00** |Syllabus                   |Birgitte
**9.10** |Python in general          |Birgitte
**9.20** |Load modules and run       |Birgitte
**9.45** |Break                      |.
**10:00**|Packages  (45-->30)        |Richel
**10.45**|Break                      |.
**11.00**|Isolated environments      |Richel
**12.00**|Lunch                      |.
**13.00**|Batch                      |Birgitte
**13:20**|GPU                        |Birgitte
**13.30**|Kebnekaise: Jupyter        |Birgitte
.        |Rackham:  Interactive session and Jupyter|Richel
**13.45**|Break                      |.
**14.00**|Parallel and multithreaded functions|Pedro
**14.25**|Conclusion & Q/A           |Birgitte
**14.45**|Evaluation                 |.

## Progress

Use Python 3.11.8 on UPPMAX

* [Done] Packages
* [Done] Virtual environments
* [Done] Rackham:  Interactive session
* [Good enough] Jupyter


## Lesson plan notes

* 10:00-10:45: Packages:
    * Exercise 2 for HPC2N has untested TensorFlow things
    * Put learners
* 11:00-11:15: Break
* 11:15-12:00: Isolated environments
    * Exercise 2 is UPPMAX only
    * Exercises 2.4 and 3.4 take 6 and 13 minutes
* 12:00-13:00: Lunch break
* 13:30-13:45: UPPMAX-only
    * Interactive: only 1.1, 1.2, 1.3 and 1.5
    * Jupyter: only show and run


## Discussion

### Pre-requirements

I feel the pre-requirements page, <https://uppmax.github.io/R-python-julia-HPC/prereqs.html>, is too extensive.
I feel it should link to regular documentation and mostly show
how to determine you fulfilled all pre-requirements.

## Interactive

The session on starting an interactive session feels too fancy twice:

* create an interactive session
    * with 1 node
    * with more nodes <--- feels beyond the teaching goals
* run 2 Python scripts, 1 of which is unsuitable for an interactive session
  with more nodes.

I think, for 15 minutes, one can only do 1 node and no Python script,
to achieve the teaching goals.

## Impressed by Birgitte

I think it was impressive that Birgitte logs in into both clusters at the start.
I want that too!

## Why ssh `-Y`

Unrelated to the course, Birgitte does so.

## Loading Python

If the session is about loading Python,
maybe seeing module dependencies can removed.

Also, don't care about python3?

Also, don't care about IPython?

## Suggest to Arvid

The Bianca portal is great. Could you do the same for Rackham?
Not every user understands one needs to use 2FA now, and how

## Technical problems

This was quite annoying. Due to this, I cannot see how much the
learners have understood and progressed through the exercises.

## More time for sbatch

There was no time for an exercise.

I would have enjoy to be sure that the learners have been able
to submit a job and see the results.

## More time for GPU

There was no time for an exercise.

## More time for UPPMAX interactive and Jupyter

There was no time for an exercise.

## Parallel programming

I feel that making a script suitable (with `**FIX**` in it)
for a parallel run is at the 'Synthesis' level of Blooms taxonomy.
I feel that some levels lower, e.g. 'Apply' with a step-by-step
guide would be more suitable.
