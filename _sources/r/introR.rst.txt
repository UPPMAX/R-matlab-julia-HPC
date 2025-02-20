Introduction R
==============

.. figure:: img/r_logo_50.png

.. admonition:: Prefer this session as video?
    :class: dropdown

    See `this YouTube video <https://youtu.be/N-TRzv9LdF4>`_,
    to see this session as a video.

.. tabs::

   .. tab:: Learning objectives

      - see a first overview of the R programming language
      - see the overview of the course
      - hear about 'the tarbal with exercises'

   .. tab:: For teachers

      Teaching goals are:

      - Learners have seen an overview of the course
      - Learners have seen an first overview of the R programming language

      Lesson plan (15 minutes in total):

      - 9:00: 2 min: discuss random people with videos, based on recommendation by [Bell, Mike. The fundamentals of teaching: A five-step model to put the research evidence into practice. Routledge, 2020]
      - 9:02: 3 mins: Prior
         - What is R?
         - Why use R?
         - What are features of R?
         - Can R do everything?
         - What are R packages?
      - 9:05: 5 mins: Present: First overview of R
      - 9:10: 5 mins: Present: Course schedule

.. admonition:: **Course learning objectives**
 
    - use the module system to load R
    - use the module system to load site-installed R packages
    - find out which versions of R and packages are installed
    - run R scripts
    - write a batch script for running R
    - install R packages from CRAN
    - see how to install other R packages yourself
    - start batch jobs 
    - run RStudio

    on HPC2N, UPPMAX, or LUNARC

.. admonition:: **Course non-goals**

    - improve R coding skills 
    - use R on other HPC clusters

First overview of R
-------------------

R is a programming language for statistical computing and data visualization
(from `Wikipedia <https://en.wikipedia.org/wiki/R_(programming_language)>`_).

.. mermaid:: intro_r_overview_r.mmd 

The main general R resources are:

- `The R homepage <https://www.r-project.org/>`_
- `The official R documentation <https://cran.r-project.org/manuals.html>`_
- `The CRAN homepage <https://cran.r-project.org/>`_

R is used in many NAISS centres:

- `here is an overview of 6 NAISS centres and their R documentation <http://docs.uppmax.uu.se/software/r/#overview-of-naiss-centers-and-their-documentation-about-r>`_
- `here is an (incomplete) overview of R courses being taught at NAISS <http://docs.uppmax.uu.se/software/r/#learning-r>`_


Schedule
--------------------

.. mermaid::  intro_r_overview_course_login_and_scheduler.mmd

.. mermaid::  intro_r_overview_course_r_and_modules.mmd

+-------+------------------------------+--------------+
| Time  | Topic                        | Teacher(s)   |
+=======+==============================+==============+
| 9:00  | (optional) First login       | BB + PO + RB |
+-------+------------------------------+--------------+
| 9:45  | Break                        | .            |
+-------+------------------------------+--------------+
| 10:00 | Introduction                 | RB           |
+-------+------------------------------+--------------+
| 10:10 | Syllabus                     | RB           |
+-------+------------------------------+--------------+
| 10:20 | Load modules and run         | RB           |
+-------+------------------------------+--------------+
| 10:45 | Break                        | .            |
+-------+------------------------------+--------------+
| 11:00 | Packages                     | BB           |
+-------+------------------------------+--------------+
| 11:30 | Isolated environments        | BB           |
+-------+------------------------------+--------------+
| 12:00 | Lunch                        | .            |
+-------+------------------------------+--------------+
| 13:00 | Batch                        | BB           |
+-------+------------------------------+--------------+
| 13:30 | Parallel                     | PO           |
+-------+------------------------------+--------------+
| 14:15 | Break                        | .            |
+-------+------------------------------+--------------+
| 14:30 | Simultaneous session         | .            |
+-------+------------------------------+--------------+
| .     | HPC2N: ThinLinc, RStudio     | PO           |
+-------+------------------------------+--------------+
| .     | LUNARC: On-Demand, RStudio   | RP           |
+-------+------------------------------+--------------+
| .     | UPPMAX: Interactive, RStudio | RB           |
+-------+------------------------------+--------------+
| 15:15 | Break                        | .            |
+-------+------------------------------+--------------+
| 15:30 | Machine learning             | BB or PO     |
+-------+------------------------------+--------------+
| 16:00 | Summary and evaluation       | RB           |
+-------+------------------------------+--------------+
| 16:15 | Done                         | .            |
+-------+------------------------------+--------------+

- RB: suggest to make 'Batch' 15 minutes longer and remove a session,
  in the next course iteration

Exercises used in the course
----------------------------

The course uses a so-called tarball files with exercises as
used in this course.

See `here <https://uppmax.github.io/R-python-julia-matlab-HPC/common/use_tarball.html>`_
how to get and decompress it.

In the 'Load modules and run' session, there is the time to do so.
