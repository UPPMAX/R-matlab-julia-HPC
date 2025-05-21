# Reflection

 * Teaching day: 2023-03-14
 * Topic: R
 * Written on 2023-03-14

Time     |Topic                            |Teacher
---------|---------------------------------|-------
**9:00** |Syllabus                         |Richel
**9:10** |R in general                     |Richel
**9:20** |Load modules and run             |Richel
**9:45** |Break                            |.

I only taught the first hour.

I talk before teaching, it feels nicer.

At the start of the lecture, I shared that I will pick random people
and why. Adding the 'why' hopefully helps learners understand
why I should do that. I feel discussing teaching literature should
not be done during a lesson, yet, however, it does show that I
read (part of) the student evaluation.

At the 'Prior Knowledge' part, I asked randomly and polled answers using
Zoom 'Reactions'. When discussing modules, it made me see that not everyone
understood what modules are. This allowed me to backtrack and discuss
what modules are.

I feel I talked too long and I went to slow.
Instead of going through the text, only give an
overview and enough info to do the exercises.
Exercises should start with 'read ...'.

- [ ] TODO: talk less, more time for exercises

Could not do 'Feedback' due to technical problem.

Technical problem was solved after updating Zoom.

There was a copy-paste mistakes in the R versions used,
as there is a difference between the one on HPC2N and the one on UPPMAX.
During the exercises, the learners found out,
contacted me and I fixed it immediately.

There were mistakes in the HPC2N answers.
During the exercises, the HPC2N users found out
that it did not work. This is probably because the course
switched to using R 4.1.2 and it was forgotten to update
the version of the prerequisite modules.
During a one-on-one with a learner in a breakout room,
we used `module help R/4.1.2`, loaded the prerequisites
of the right version and observed it worked.
I immediately updated the documentation.

Although there were mistakes found in my exercises,
I gave the learners the most time on doing exercises,
monitored their progress during this and
interacted with them. Or: mistakes were found in my
exercises, because the exercises were actually done
with a level of interaction that allows the learners
to actually share the mistakes.

I wonder how many learners:

- have started R (I could not ask, due to technical problem)
- have run an R script (I could not ask, due to technical problem)

I lead the evaluation. I took the learners to a Breakout room,
told them why this is important, how to answer and to come
back to the main room to say bye or ask questions.

## Things beyond my teaching

There was a mismatch between the schedule we as teachers had
in a shared HackMD document and the one on the course website.
Already in a meeting, I suggested to remove the shared HackMD document
one, to prevent the possibility of a mismatch, but there was resistance there.
The teachers improvised.

I have a hard time to summarize the learning objectives of other lessons:
there is too much stuff that is 'nice to have' in it;
it feels more like if randomly content gets added or deleted.
What is the decision rule to decide what should be in and what should not
for those lessons?

Examples of content I remove, as it would not fit my teaching goals:

- describing an R package in details: this is not an R course
- when learning how to run an R script, running it on multiple nodes:
  do that in the session on parallel programs
- on R virtual environments: use a virtual environment, not describe
  what it is in detail
- in the parallel programs, letting learners fix code for parallelizing
  code: this is not a course on parallel programming. Instead,
  let them run code that can do calculations in parallel, on the CPU/GPU

I feel that when someone is teaching, he/she should prioritize interacting
with the learners over answering questions in a shared document.
I feel the other team members should answer the questions in a shared
document, so that the main teacher can focus on interacting with the learners.

For the other session, I wonder how many learners:

- have created a virtual environment
- have run code that uses a GPU
- have run code that uses machine learning
- have installed a package from CRAN
- have installed a package from GitHub
- have logged in with the remote desktop website
- have logged in with a local ThinLinc client
- have started RStudio

## Evaluation

### Overall, how would you rate today's training event?

- 7: 5x
- 9: 6x
- 8: 1x

### Today's content and feedback to the lecturers (e.g. materials, exercises, structure): – What did you like best?

- materials and structure
- materials are great
- materials
- introduction and packages
- The explanation on how R in hpc environment can be used for machine learning and how to run RStudio interface on cluster
- materials are well structured
- exercises
- structure and material
- The exercises were helpful
- step by step lessons; classes available in youtube for later watching

Hey, someone likes our YouTube videos!

- well thought structure and training exercises with clear and helpful lectures
- I liked the handling of packages, since it is very useful in R!

### Today's content and feedback to the lecturers (e.g. materials, exercises, structure): – Where should we improve?

- maybe more about onboarding

I agree that this was advertised too late.

- exercises could be improved in tandem speed with students.
- Parallel and multithreaded functions was short and fast and would have liked to get info on background, how, why instead of just Learning how to sbatch. Would have been good to learn more about the topics.
- Overall organization, speaking turns, given time and supervision for exercices
- I would have liked to learn how the parellel code works rather than just knowing it can be sbatched

I think Pedro has no time for that, we teach at the Apply level.

- it felt rushy at some points
- exercises
- Two things, maybe more time for parallel computing and Machine Learning
- I would also have enjoyed Matlab but I think knowing R and Python in HPC is enough for applying this knowledge to Matlab.
- more time for the code-along and training exercises, maybe separating the code-along for the different centers on the presenter´s screen that was a bit confusing from time to time. Also when giving lecture do one center at on time and then move on
- I would have needed a bit more time for the exercises, and maybe a bit more? I'll finish it later =) But otherwise very good.

The usual: learners had too little time for exercises.
As the one teaching only the first hour with most time spend
on an exercise, I assume this address me.

### Length of teaching today was

- Adequate: 11x
- Too short: 2x

### Depth of content was

- Adequate: 12x
- Too superficial: 1x

### The pace of teaching was

- Adequate: 8x
- Too fast: 5x

### Teaching aids used (e.g. slides) were well prepared

- Agree completely: 4x
- Agree: 7x
- No strong feelings: 2x

### Hands-on exercises and demonstrations were

- Adequate: 7x
- Too few: 6x

### Hands-on exercises and demonstrations were well prepared

- Agree completely: 4x
- Agree: 6x
- No strong feelings: 3x

### How would you rate the instructors overall teaching performances?

- 10: 1x
- 9: 4x
- 8: 4x
- 7: 2x
- 6: 2x

### Do you feel you achieved your desired learning outcome?

- Yes: 11x
- Not sure: 2x

### Did today's course meet your expectation?

- Yes: 11x
- Not sure: 1x
- No: 2x

### Do you have any additional comments?

- Thanks
- More time for hands on exercises would be appreciated.
  The teaching felt unidirectional as it was too fast that
  there was no space to ask questions and interact
- Can we have a specific ML course on R and python online please?
  It will be great to build models with you guys.

## Reflection after evaluation

I think the evaluation questions are mostly useless for me,
as judged by me thinking about them.

My dream evaluation would be:

- What should we keep doing?
- Which teacher(s) scheduled enough time for exercises?
- What should we improve?
- Other comments?
