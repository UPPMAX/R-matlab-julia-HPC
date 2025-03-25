# Reflection

- Author: Richel
- Date: 2025-03-24
- Language: R
- [Lesson plans](../../lesson_plans/20250324_richel/README.md)
- [Evaluation](../../evaluations/20250324/README.md)

- Registrations: 33
- Participants: 12 (36% of registrations shows up)

With the 1 hour optional login session, we
give 1 hour of teaching to the unprepared,
while sacrificing 1 hour of teaching for the
prepared. I think we should reward the prepared,
by not having this drop-in.

However, at the drop-in, 9 showed up, of which 5
were put in a breakout room with me. There, I
discovered how useful it is. There were 2 out
of 5 that could not have logged in without this
session. Also, it is a great first impression
of our students.

```bash
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
| 15:30 | Machine learning             |  PO          |
+-------+------------------------------+--------------+
| 16:00 | Summary and evaluation       | RB           |
+-------+------------------------------+--------------+
| 16:15 | Done                         | .            |
+-------+------------------------------+--------------+
```

The course is an introduction course. I feel the start-up parts
are given too little time, for the things that I do not consider
being beginner topics. I feel beginner things need their time,
over sacrificing it for more sexy topics.

Remove, in order of my preference:

- Machine learning
- Parallel
- Isolated

I will suggest this in a meeting:

- [ ] Suggest to remove 'Machine learning'
- [ ] Suggest to remove 'Parallel'
- [ ] Suggest to remove 'Machine Isolated'

My favorite schedule

```bash
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
| 11:00 | Break                        | .            |
+-------+------------------------------+--------------+
| 11:15 | Packages                     | BB           |
+-------+------------------------------+--------------+
| 12:00 | Lunch                        | .            |
+-------+------------------------------+--------------+
| 13:00 | Batch                        | BB           |
+-------+------------------------------+--------------+
| 14:00 | Break                        | .            |
+-------+------------------------------+--------------+
| 14:15 | Simultaneous session         | .            |
+-------+------------------------------+--------------+
| .     | HPC2N: ThinLinc, RStudio     | PO           |
+-------+------------------------------+--------------+
| .     | LUNARC: On-Demand, RStudio   | RP           |
+-------+------------------------------+--------------+
| .     | UPPMAX: Interactive, RStudio | RB           |
+-------+------------------------------+--------------+
| 15:00 | Break                        | .            |
+-------+------------------------------+--------------+
| 15:15 | To be decided by vote        | ?            |
+-------+------------------------------+--------------+
| 15:45 | Summary and evaluation       | RB           |
+-------+------------------------------+--------------+
| 16:00 | Done                         | .            |
+-------+------------------------------+--------------+
```

I felt rushed during my session, with only 45 minutes.
The learners did reach the learning outcomes in time,
but I had no time to discuss this with them. Sure,
one could argue that the LOs have been achieved,
yet, on the other hand, there was no proper
Feedback phase.
 
I was a helper during the other sessions. I was not a very good helper:
I find it hard to stay focused during monologues.

![Average learning outcomes per session](../../evaluations/20250325/average_learning_outcome_per_question.png)

My grades:

learning_outcome                                                                 |success_score|Comment
---------------------------------------------------------------------------------|-------------|-------
I can find the module to be able to run R                                        |94           |Mine, great
I can load the module to be able to run R                                        |94           |Mine, great
I can run the R interpreter                                                      |94           |Mine, great
I can run the R command to get the list of installed R packages                  |88           |Mine, great
I can run an R script from the command-line                                      |88           |Mine, great
I can find out if an R package is already installed                              |81           |Mine, was extra
I can load the pre-installed R packages                                          |88           |Mine, great
I can install an R package from CRAN                                             |81           |Not mine
I can use renv to create, activate, use and deactivate a virtual environment     |62           |Not mine
I can submit a job to the scheduler to run an R script with regular code         |78           |Not mine
I can submit a job to the scheduler to run an R script that uses parallel code   |69           |Not mine
I can submit a job to the scheduler to run an R script that uses a GPU           |56           |Not mine
I can find and load the R machine learning modules                               |50           |Not mine
I can submit a job to the scheduler to run an R script that uses machine learning|50           |Not mine
I can start an interactive session                                               |81           |Simultaneous session
I can verify I am on the login node yes/no                                       |78           |Mine, not taught explicitly
I can start an interactive session with multiple cores                           |78           |Mine, not taught explicitly
I can start RStudio                                                              |84           |Simultaneous session

My worst sessions were those that were optional and/or in the
simultaneous sessions. I find it hard to convince myself to take a
second look at my material, as the learning outcomes are achieved too
well.
