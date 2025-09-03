# Reflection

* Teaching day: 2023-03-12
* Topic: Python
* Written on 2023-03-12

## Schedule

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
**14.45**|Evaluation                 |Richel

## Reflection

I prepared well for the lessons, as I remembered from the
previous course iteration that my material was not blended
in with the others. This iteration, my material was 100% part of the
course website and I removed the presentation slides from the
previous iteration.

Although I did invest 10 + 2 + 16 + 2 = 30 hours,
with little sleep, the day of teaching went fine.

The most obvious problem during teaching
was that Zoom did not allow me to speak
or show video, in the main room,
when breakout rooms are active.

I think we dealt with this technical problem
as good as we reasonably could.

However, due to it, I cannot properly evaluate my own lessons.
I was annoyed with being this blind as a teacher:
how can I know if the learners understood,
if I cannot see their exercises?
Also, I did not do a half-way-during-the-exercise feedback,
nor a nearly-the-end-of-the-hour feedback.
And I was unable to see if the exercise lengths
matched the time allocated.

There were some mistakes:

* [Fixed] The exercises on venv failed due to the install of a package
  in the session before. Next time, ruthlessly
  delete the `/home/richel/.local/lib/python3.11` folder.
  I've added this to the course material
* I could not demo going into the remote desktop website of Rackham.
  Repeat this next time!

I feel that is as much as I have to reflect on.
I think it went quite smoothly when correcting for the
technical error.

## Discussion on other sections

### Pre-requirements

I feel the pre-requirements page, <https://uppmax.github.io/R-python-julia-HPC/prereqs.html>, is too extensive.
I feel it should link to regular documentation and mostly show
how to determine you fulfilled all pre-requirements.

### Interactive

The session on starting an interactive session feels too fancy twice:

* create an interactive session
    * with 1 node
    * with more nodes <--- feels beyond the teaching goals
* run 2 Python scripts, 1 of which is unsuitable for an interactive session
  with more nodes.

I think, for 15 minutes, one can only do 1 node and no Python script,
to achieve the teaching goals.

### Impressed by Birgitte

I think it was impressive that Birgitte logs in into both clusters at the start.
I want that too!

### Why ssh `-Y`

Unrelated to the course, Birgitte does so.

### Loading Python

If the session is about loading Python,
maybe seeing module dependencies can removed.

Also, don't care about python3?

Also, don't care about IPython?

### Suggest to Arvid

The Bianca portal is great. Could you do the same for Rackham?
Not every user understands one needs to use 2FA now, and how

### More time for sbatch

There was no time for an exercise.

I would have enjoy to be sure that the learners have been able
to submit a job and see the results.

### More time for GPU

There was no time for an exercise.

### More time for UPPMAX interactive and Jupyter

There was no time for an exercise.

### Parallel programming

I feel that making a script suitable (with `**FIX**` in it)
for a parallel run is at the 'Synthesis' level of Blooms taxonomy.
I feel that some levels lower, e.g. 'Apply' with a step-by-step
guide would be more suitable.

## Evaluations


### Overall, how would you rate today's training event?


* 5: 2x
* 6: 2x
* 7: 4x
* 8: 11x
* 9: 3x
* 10: 3x

Average: `((2 * 5) + (2 * 6) + (4 * 7) + (11 * 8) + (3 * 9) + (3 * 10)) / 25` = 7.8

## Today's content and feedback to the lecturers (e.g. materials, exercises, structure): – What did you like best?

Here I aggregate the learners feedback, where I do put some under multiple topics.
As all sentences are unique, such duplicates can be spotted.

Structure:

* The structure is good.
* exercises and structure
* Good instructions, positive supportive and friendly environment, nice course structure, basic exercises.
* The format and structure was good, hands on exercises was also good.
* materials, exercise and structure
* Materials and structure were good

Exercises:

* exercises
* exercises and structure
* Good instructions, positive supportive and friendly environment, nice course structure, basic exercises.
* The format and structure was good, hands on exercises was also good.
* materials, exercise and structure
* Clear exercises and instructions, availability of deepening material
* I like that the material was very well prepared and with this guidance I understood concepts and managed to do task that I could not do by myself

Materials:

* good material on the web that was easy to follow
* The wiki of the course is really good. I will continue using it as a documentation after the course.

As, there is [no wiki](https://github.com/UPPMAX/R-python-julia-HPC/wiki),
I will count this under 'materials'.

* materials
* The topic covered
* materials, exercise and structure
* Materials and structure were good
* Clear exercises and instructions, availability of deepening material
* <https://uppmax.github.io/R-python-julia-HPC/prereqs.html> <- this webpage was great!
* materials
* Very good material, mostly in one location
* material gathered in one space
* info mail was +1, same for material

Lectures:

* The lectures were very clear and the teachers were very good

Teachers

* The lectures were very clear and the teachers were very good
* Good instructions, positive supportive and friendly environment, nice course structure, basic exercises.

Sections:

* The part before lunch was very clear and easy to understand despite the technical issues

I taught before lunch, so maybe this was my part?

Misc:

* A good overview. I think I'll find the Jupyter lab and env extra useful in the future!
* info mail was +1, same for material

### Reflection

The learners again like the structure of the course and the course material.

Maybe they do like the
my teaching ('The part before lunch')
and my exercises even
better ('basic exercises', 'hands on exercises').

I am happy one learner mentioned 'positive supportive and friendly environment'!

## Today's content and feedback to the lecturers (e.g. materials, exercises, structure): – Where should we improve?

Here I aggregate the learners feedback, where I do put some under multiple topics.
As all sentences are unique, such duplicates can be spotted.

### Compliments

* None
* Very good, they were motivated and clear.

### Time organization and afternoon was fast or too short

* a bit more time dedicated to Jupyter
* The time dedicated for the interactive session/jupyter was not sufficient to try ourselves.
* The last part on Parallel and multi-threaded functions was a bit fast due to time which happens of course but it would be good to learn more on that.
materials
* The after lunch section was really difficult for me to follow, I feel like the lecturers didn't stop long enough on each topic to explain it properly and I only got a partial understanding
* Maybe a better distribution of time between exercises would benefit. Spend less time on the beginning and give more time to run examples on the interactive and parallel parts. Because I think this is the part were we need more help.
* the 14:00 to 15:00 session was a bit hard to keep up with.
* Time per exercise can be optimised. More time for python jupyter and GPU exercises will be good for us.
* Time organization: morning pace was slow compared to the afternoon one. Maybe more time of coding together with the lecturer, especially for the second part of the program (more complex concepts of batch work and interactive work)
* The first part was a good pace for me, but the second part was more complicated and I did not have time to follow and do the exercises. Maybe the second part could be done in another session, because it is the most important part to take use the resources and take advantage of that. However, I got many tools to start my own projects.

'The first part' was partially my part :-)

* more time for exercises in afternoon, more time for the batch section, maybe don't ask random people to answer stuff I don't like that (stress - introvert)
* more time for exercises in afternoon, more time for the batch section, maybe don't ask random people to answer stuff I don't like that (stress - introvert)

### Teaching

* Teaching was quite fast. Sometime hard to follow.
* I personally thought Birgitte was too fast and I could not follow. I liked Richel the most.

Hey, that is a fun compliment! Thanks!

* more time for exercises in afternoon, more time for the batch section, maybe don't ask random people to answer stuff I don't like that (stress - introvert)

I will keep asking random people, because a teacher needs to monitor the
progress of all learners. However, at that day, I did not think
it was necessary to share why I ask random learners and that it is
recommended by the literature. I would correct this two days later,
let's see if that made it into the feedback.

* more and slower code-alongs
* The pace was relatively slow, which was great. as then also those how have very limited knowledge can also keep up the pace. However, in the afternoon it clearly went more faster. Maybe speed up in the morning a bit to have more time practicing actually submitting the jobs? As that was my main motivation for this, I basically skipped the very last lecture about parallelization and instead coded to make submitting batch jobs work.

### Materials

* There were some errors/not updated in the exercises in the material. Also can more of the material be on the course pages instead of pointing to documentation at the centers? It makes it clearer when we don't have to go difference places

I understand this feedback, yet I do think it is a bad idea: a learner
should get accustomed to the documentation of his/her HPC center.

### Other

* If prerequisite is well informed, such as little knowledge on Linus? it would have been better.

### Reflection

Most of the negative feedback was about the high pace
in general, yet mostly in the afternoon.
I feel I was not the reason for that feedback.

I did get negative feedback on:

* course material in one place
* ask random people

Although I agree with the feedback, I will not change this,
as there are good reasons to do so.

## Length of teaching today was

* Too short: 8x
* Adequate: 16x
* Too long: 1x

I think learner-centered teaching would solve this,
i.e. by only teaching that amount of concepts
that are confirmed to be understood by an exercise.


## Depth of content was

* Too superficial: 5x
* Adequate: 20x

## The pace of teaching was

* Too slow: i
* Adequate: iiiiiiiiiiiiiii
* Too fast: iiiiiiii

I think learner-centered teaching would solve this,
as -by definition- one follows the pace of the learners.

## Teaching aids used (e.g. slides) were well prepared

* Agree completely: 7x
* Agree: 15x
* No strong feelings: 3x

## Hands-on exercises and demonstrations were

* Adequate: 17x
* Too few: 7x

I think this is a nonsense questions: either we do
exercises (i.e. active teaching) or we do demonstrations (i.e. passive teaching).
Only from this question, one would have idea what was too few off:
only the written texts earlier indicates that there should be more exercises.

## Hands-on exercises and demonstrations were well prepared

* Agree completely: 7x
* Agree: 13x
* No strong feelings: 4x
* Disagree: 1x

## How would you rate the instructors overall teaching performances?

This is a useless question, as there were 4 teachers, but here goes:

* 10: 4x
* 9: 5x
* 8: 4x
* 7: 8x
* 6: 3x

Average: `((4 * 10) + (5 * 9) + (4 * 8) + (8 * 7) + (3 * 6)) / 24` = 8.0

## Do you feel you achieved your desired learning outcome?

* Yes: 17x
* Not sure: 8x

## Did today's course meet your expectation?

* Yes: 18x
* Not sure: 7x

## Do you have any additional comments?

### Thanks

* Thanks for the course, it was very useful and I feel encouraged to start my project.
* Overall a great introductory course to get grasp of the basics in a positive and supportive environment with knowledgeable instructors.
* Thanks for your lecture and your time.

### Misc

* Can we have something like BYOC and you can show us how to use it to asses time and core used using library multiprocess, please?
* A bit too uneven speed with too low in the morning and too high in the afternoon or at least too little time in the afternoon to go through everything

Agreed, I think learning-centered teaching would solve this.

* Some students had problems logging in to the needed systems. I also just noted that there was this log-in session in Monday when you mentioned it on tuesday. Maybe advertise that in the very beginning of the information email so that it does not go unnoticed. I had no problems logging etc, but those who had would have benefited participating on Monday

Agreed, we could be more ruthless in letting our learners in, e.g. by putting
the link to the Zoom on Rackham and Kebnekaise.

### Diversity of teachers

* I can not evaluate the performance of each part in a single evaluation form, as I felt it was very different depending on each teacher

Agreed.

### Zoom room

* More time to exercises. and the zoom problems made it confusing. I know it's not your fault. Maybe don't use breakout rooms so  much , especially when you know there are problems? I have never been in a course where it works well to go back and forth between breakout rooms. Just use them as backup if anyone need to get private help.

I agree that the technical problems are annoying. The Zoom room use,
i.e. of having a silent room, I now think it is a bad idea.
Instead, doing Pair-Share-Pound in little groups would make it work.

### Exercises

* More time to exercises. and the zoom problems made it confusing. I know it's not your fault. Maybe don't use breakout rooms so  much , especially when you know there are problems? I have never been in a course where it works well to go back and forth between breakout rooms. Just use them as backup if anyone need to get private help.
* i really need more time for exercises

### Reflection

I agree that the Zoom setup could be improved, next to the technical problems.

I think the evaluation questions are mostly useless for me,
as judged by me thinking about them.

My dream evaluation would be:

* What should we keep doing?
* Which teacher(s) scheduled enough time for exercises?
* What should we improve?
* Other comments?

### Course-wide interpretation

I think the general course advice would be: talk/demonstrate less,
do more exercises instead.

