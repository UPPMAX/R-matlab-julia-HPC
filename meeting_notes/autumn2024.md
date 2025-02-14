# Autumn 2024

## Dates



week 43: Mon 21 Oct - Fri 25 Oct:

- Onboarding: Mon 21 Oct at : Bj+ Ri
- Python: Tuesday 22nd Oct: Re + Bi + PO ?Ri
- Julia: Wednesday 23rd Oct BC, P
- R: Thursday 24th Oct: Ri?
- Matlab: Friday 25th Oct: Bi + Bj + Pe + Re

General meetings on Fridays(?) every week

## Meeting Fri 18 Oct at 13

### Status

- General
    - registered
        - Around 56 learners. Will be shared later in the Slack today
    - projects
        - BC: Can I be proxy to the NAISS project? BB: BC will be made proxy to the course NAISS project
        - Project codes: 
            - UPPMAX: naiss2024-22-1202
            - LUNARC lu2024-7-80
    - prereqs
        - updated
    - syllabus page
        - [x] B volunteers to clean up https://uppmax.github.io/R-python-julia-matlab-HPC/index.html
    - schedules
        - parallelism 45 min
            - [x] all but python (it has 35 mins now)
            - VOTED: agree to find the time
        - python
            - rethink length of sessions and content? DISCUSS further down
    - automatic checkers
        - RB: can the link checker be turned on again? 
            - Yes, we use Issues reports instead of emails
        - spelling:  Rather in phase
            - Yes, change to use Issues reports instead of emails
            - RB will make the change
        - syntax: Rather in phase (domentation action)
        - links: misbehaving of github pages
            - RB checks the link checker
- Different days
    - Python day
        - RB: what of the LUNARC part of the simultaneous session?
            - RP: can show Spyder and Jupyter, OpenOnDemand is already covered
        - BC: remove conda
            - Yes: BB, RB
    - Julia day: nothing to report
    - R day: nothing to report
    - Matlab day
        - BC works with add-ons and local desktop 
        - RP: where to put cluster configuration stuff? How does the `configCluster`
          command work on the different clusters


- Have all exercises ready on Monday, so a tarbal can be created

### Discuss

- Issue [#66](https://github.com/UPPMAX/R-python-julia-matlab-HPC/issues/66) Python Schedule
    - Add 10 mins for parallel
    - RB: volunteers to remove all or some of isolated environments sections:
        - (-15 minutes) Only remove exercise 3: export and import a virtual environment
        - (-15 minutes) Only remove exercise 2 'work with Example-gpu
            - This is needed by the session on GPUs
            - BB can change the exercise without this exericse
        - (-30 minutes) Remove exercises 2 and 3
            - DECIDED: R moves these to Extra
        - (-60 minutes) Remove whole section
    - Isolated environment, on conda:
        - UPPMAX: only recommended on Bianca
        - LUNARC: talk to jonas
    - [ ] RB will update schedule and ping BB
- Issue [#57](https://github.com/UPPMAX/R-python-julia-matlab-HPC/issues/57) CoC email
    - Keep Richel's email, if things go wild, it will discussed in a meeting
- Other issues?
- Other things
    - Monday 13:00-14:00 onboarding at [onboarding Zoom](https://umu.zoom.us/j/62612416748?pwd=FX3dgIDLfyAkYa9drDQiLO6bTxNfAy.1), see email
        - Can be there: probably BB, RB, BC

### ToDos


## Meeting Fri 11 Oct at 13

### Status

- General
    - registered
        - BB: 48
        - RP: Any new ones from LUNARC? BB: no, still 12
    - projects
        - RP started applying, not complete yet
        - Unsure what the acceptance time is
    - [prereqs](https://uppmax.github.io/R-python-julia-matlab-HPC/prereqs.html)
        - should be prioritized before sending out info
        - RB and BC will do so before Wednesday
    - syllabus page
        - RB has commented
    - Make schedule work with 45 m of parallelisms each day
        - suggestion finished by Friday 11 Oct
        - BC and RB agree
    - Exercise directory in the github repo
        - Julia add: BC no progress yet
        - MATLAB add: discussed later. 
            - Q: which ones will I do? 
            - A: the ones in the session that you teach BB
        - batch scripts for COSMOS: RP added a couple

    - *Briefly* about doings that can be interesting for all
      - Python
        - RB: [created a draft of evaluations questions](https://github.com/UPPMAX/R-python-julia-matlab-HPC/tree/main/evaluations/20241022), please correct
            - use with possible modifications
        - Should we introduce Spyder? 
            - Neutral: PO
            - No: RB
            - [?VOTED?] Not yet: BC, BB, RP (still need to decouple from Anaconda3)
        - Should we remove or cut down on IPython since most people don't seem to use it directly?
            - [VOTED] Yes: RB, RP, BC, BB, PO
            - No: 
    - R
        - RB: [created a draft of evaluations questions](https://github.com/UPPMAX/R-python-julia-matlab-HPC/tree/main/evaluations/20241024), please correct
            - use with possible modifications
        - Which R version do we use? R versions are 4.1.2 on AMD node on Kebnekaise, 4.1.1-4.3.2 on UPPMAX, 4.2.1-4.4.1 on LUNARC, ? on UPPMAX. Material uses version 4.1
            - Discuss later in the week on Slack, when we create our course material. LUNARC adnd HPC2N decide :-)
    - MATLAB
        - we need a file describing the parpool, batch and jobs inside matlab
        - we need a short intro to slurm system before
        - the recent parallelism session is to come after 
    - Julia
        - Some updates made
        - 
### Discuss

- syllabus page
- exercises
    - wget ONE tar.zip file per language
        - YES


### The topics

- [Python](https://hackmd.io/o_b5yHAJRBeQfTbNvYOK2A#)
- [R](https://hackmd.io/gV_gdctHQPWz6eElFWfq6Q#)
- [Matlab](https://hackmd.io/RTujs9MnS0ehsGD7ufNBfA#)
- [Julia](https://hackmd.io/ERX9FIgyR_6wDbmcqi_8HA#)

### ToDos

- Prerequisites
    - [ ] RB and BC will do so before Wednesday
- [ ] BB: Create a tarbal per language and put it on GitHub
- [ ] RB [Issue 51: run CI tests on main only](https://github.com/UPPMAX/R-python-julia-matlab-HPC/issues/51)
- [ ] bc: images of HPC system

## Meeting Fri 4 Oct at 11

### Status
- General
  - schedules on our websites says ending at 15! 
      - BB and BC updates "**16**" the local websites
          - plus "note the change..."
      - also in invitation
          - Rebecca pings Joachim
  - Registered
      - 37
      - is there a local reg page at LUNARC?
          - Rebecca checks with Joachim
  - Projects
      - snic_ae NAISS 2024/5-11
          - Rebecca asks for membership
  - Prereqs
      - no news
  - Syllabus
  - Login 
    - Input from you!
  - Cosmos integration in existing materials
      - Needs in advanced parts + Julia + R
      - Main responsibility on the session teacher 
  -  Parallelism
      -  Pedro has renewed his parts in a good way
      -  timing was different
      -  suggestion 45m for all days
  - *Briefly* about doings that can be interesting for all
    - Python
    - R
    - MATLAB
    - Julia
        - 1.8.5 (installed in all centres)
### General discussions

- Change Objective boxes to Learning Outcomes/(or objectives)?
    - formulate what students shall have learnt or accomplished during lesson instead of content
    - done already in some sessions
        - Ex: https://uppmax.github.io/R-python-julia-matlab-HPC/python/packages.html
    - Alt1: Don't change
    - **Alt2**: keep heading of the box (objectives) but formulate to students' view with focus on verbs: BB, RP, PO
    - Alt3a: Also change to learning outcome
    - Alt3b: Also change to learning objectives BC
- Common section and content
    - How to do it?
    - VOTE: remove "parallel" from common section but keep login here!
### The topics

- [Python](https://hackmd.io/o_b5yHAJRBeQfTbNvYOK2A#)
- [R](https://hackmd.io/gV_gdctHQPWz6eElFWfq6Q#)
- [Matlab](https://hackmd.io/RTujs9MnS0ehsGD7ufNBfA#)
- [Julia](https://hackmd.io/ERX9FIgyR_6wDbmcqi_8HA#)

### ToDos
- Make schedule work with 45 m of parallelisms each day
    - suggestion finished by Friday 11 Oct
    - BC can look at it
- Exercise directory in the github repo
    - julia add
    - matlab add
    - batch scripts for cosmos


## Meeting Fri 27 Sep at 11-12 

### Status
- General
  - Registered
    - 34 have registered, after last-week's newsletter
    - Next newsletter is next week
  - Projects
      - Teacher's NAISS project exists since today, for a year, so we can test everything there
      - [ ] BC will add Rackham and Snowy too
  - Prereqs?
      - Not done anything yet: BC, RB
      - [ ] RB will go through it
  - Syllabus?
      - RB added schedules to Python and R (formatting is bad)
      - Non-Björn should restructure this
          - [ ] RB will add Pull Requests for Python and R courses
      - see discussion


- *Briefly* about doings that can be interesting for all
    - Python
        - Settled on schedule, it's at the course website
    - R
        - Settled on schedule, it's at the course website
    - MATLAB
    - Julia

### General discussions
  - Syllabus
      - Non-Björn should restructure this.
          - Too much text
          - log in info can be moved to login sessions, see below
          - Discussed earlier that the cluster overview should be here
              - still agreeing on this?
      -  Any volunteer?
          - [ ] RB will add Pull Requests for Python and R courses, so teachers can disagree
          - When discussing X, it should be clear if it applies to all or some clusters.
          - The prereqs has a section on our clusters and it can have some repetition
          - We like pictures
          - The job scheduler is similar for all
          - HPC2N has new types of nodes and 6 different types of GPUs
          - Common part on the job scheduler, we use the same document for each 
- Common batch intro
    - [ ] BB will write the common part on the job scheduler, we use the same document for each course
    - use existing batch documents for the exercise parts (shorter)
- Login document(s)
    - [ ] RB will write this document and ask for feedback before next meeting
    - Form:
        - [DECIDED] Person in charge of that day decides on how the login session is done
            - Onboarding (only 1 session, Mo): by BB and RB
            - Login before Python (Tue): BB with other members BB RB RP
            - Login before Julia (Wed): BC with other members BB PO RP (will leave after)
            - Login before R (Thu): RB with other members BB RP (will leave after)
            - Login before Matlab (Fri): RP with other members RB BB 
          - BB + RB: Good documentation, so the learners can go through these
          - Type-along
          - dependent on how many show up
    - 1-degree of freedom
        - cluster
    - Common document, ideally 1 document, with parts that are separated by cluster in tabs
    - Use breakout rooms per center, start in main room
    - alt1: general 
        - pros: gathered
        - cons: too many degrees of freedom in one place if includeing lan
    - alt2: langauage specific
        - pros: just need tabs for the clusters
        - cons: 4 different login documents
        - 
### ToDos general
- prereqs
    - [ ] [#35](https://github.com/UPPMAX/R-python-julia-matlab-HPC/issues/35) RB + BC: improve
- syllabus renewal
    - [x] BC: makes an issue of the steps
    - [ ] RB: review by Pull Request for R and Python
    - [ ] BB will write the common part on the job scheduler, we use the same document for each course
- login document(s)
    - [x] BC: move from syllabus
        - [ ] will add Rackham and Snowy 
- NEXT 
### The topics
- [Python](https://hackmd.io/o_b5yHAJRBeQfTbNvYOK2A#)
- [R](https://hackmd.io/gV_gdctHQPWz6eElFWfq6Q#)
- [Matlab](https://hackmd.io/RTujs9MnS0ehsGD7ufNBfA#)
- [Julia](https://hackmd.io/ERX9FIgyR_6wDbmcqi_8HA#)


### General input from student
- emailing fascilities of SLURM should maybe be higlighted better
- how should you think about getting data into an out of a running job in a structured way?

----

## Schedule (updates are given in the sub-pages)

### Python (Tuesday 2024-10-22)

#### Current Python schedule

Time     |Topic                      |Teacher
---------|---------------------------|-------
**9.00** |Syllabus                   |Rebecca
**9.10** |Python in general          |Rebecca
**9.20** |Load modules and run       |Rebecca
**9.45** |Break                      |.
**10:00**|Packages  (45-->30)        |Richel
**10.30**|Break                      |.
**10.45**|Isolated environments (ML, venv, **conda**)|Richel (45-->60)
**11:45**|Break or informal chat     |Richel 
**12.00**|Lunch                      |.
**13.00**|Batch                      |Birgitte
**13:20**|GPU                        |Birgitte
**13.30**|Kebnekaise: Jupyter        |Birgitte
.        |Rackham:  Interactive session and Jupyter         |Richel
**13.45**|Break                      |.
**14.00**|Parallel and multithreaded functions|Pedro
**14.25**|Conclusion & Q/A           |Birgitte
**14.45**|.                          |.
**15.00**|END 


### Julia (Wednesday 2024-10-23)

Time     |Topic                              |Teacher
---------|-----------------------------------|-------
**9.00** |Syllabus    7                      |Björn
**9.10** |Intro, Julia in general 23         |Pedro
**9.30** |Load modules and run   16          |Björn
**9:45** |Break                              |.
**10:00**|Packages and isolated 47           |Pedro (and Björn)
**11:00**|Break                              |.
**11:15**|Parallel+multithreaded functions 30|Pedro
**11.45**|Break or informal chat or exer     |all?
**12.00**|Lunch                              |.
**13.00**|Batch and GPU     46               |Pedro
**13.50**|Break                              |.
**14.00**|UPPMAX: Jupyter and interactive 25 |Björn
.        |HPC2N: Jupyter                     |Pedro
**14.25**|Conclusion and summary, Q/A        |Björn
**14.35**|.                                  |.
**14.45**|Q/A                                |.
**15.00**|END                                |.

### R (Thursday 2024-10-24)

#### Current R schedule

Time     |Topic                            |Teacher
---------|---------------------------------|-------
**9:00** |Syllabus                         |Richel
**9:10** |R in general                     |Richel
**9:20** |Load modules and run             |Richel
**9:45** |Break                            |.
**10:00**|Packages                         |Birgitte
**10:30**|Break                            |.
**10:45**|Kebnekaise, ThinLinc & RStudio   |Pedro
.        |UPPMAX: ThinLinc, RStudio, inter-|Richel
**11:15**|Parallel                         |Pedro
**11:50**|Break or informal chat           |All
**12:00**|Lunch                            |.
**13:00**|Isolated environments            |Birgitte
**13:20**|Batch                            |Birgitte
**13:50**|Break                            |.
**14:00**|ML                               |Birgitte or Pedro <--- NEW
**14:35**|Conclusion & Q/A                 |All
**14:45**|Evaluation                       |.
**15:00**|END                              |.


### Matlab (Friday 2024-10-25)

- [name=Birgitte] **NOTE: I just used the same times as for R, and added the topics we mentioned during the first meeting about Matlab 

Time     |Topic                            |Teacher
---------|---------------------------------|-------
**9:00** |Syllabus                         |Rebecca?
**9:10** |Matlab in general                |Rebecca?
**9:20** |Load modules and run             |Rebecca?
**9:45** |Break                            |.
**10:00**|add-ons/packages                 |Björn?
**10:30**|Break                            |.
**10:45**|Slurm (matlab agnostic)          |Birgitte?
**11:15**|Parallel, syntax, pool, matlab batch, shell batch|Pedro? 
**12:00**|Lunch                            |.
**13:00**|Parallel - continued?            |Pedro?
**13:20**|GPU                              |?
**13:50**|Break                            |.
**14:00**|PARALLEL SESSIONS - desktop on demand (COSMOS)|Rebecca
**14:00**|PARALLEL SESSIONS - local desktop (UPPMAX)|Björn
**14:00**|PARALLEL SESSIONS - (jupyter notebook)|Pedro
**14:35**|interaction with other tools (brief)|?
**14:50**|Conclusion & Q/A                 |All
**15:00**|Evaluation                       |.
**15:15**|END                              |.

## Meeting 13 Sep 11:00

### agenda
   1. general
   2. python 
   3. R
   4. Matlab
   5. Julia

### Status update
- 27 so far registered

- 38 attended out of 61 in October 2023 
- 45 attended out of 82 in March 2024
- Course project
    - We do have a project allocation from LUNARC now, 
      https://supr.naiss.se/project/31438/
    - See also https://supr.naiss.se/admin/proposal/31993/
        - this is for our development!
    - student allocation as well
    - Project proposal submitted for HPC2N and for UPPMAX 

### Discuss
- general
    - RB: suggest: simplify interactive session to single-core job: it is beyond the teaching goal, nor is there time
        - vote: single: RB
        - [WINNER] vote: **1 core + 2 cores**: RP (preferred; if no time, show whichever is harder), BB, PO
        - vote: just 2 cores only (skip single allocation): BC
        - vote: wait until we know the new schedule and time-slots: BC, BB
    - RB: suggest: more time for sbatch and GPU
        - vote: yes: BC, PO (if we have exercises for R+GPU)
        - vote: no: PO (otherwise)
        - vote: No opinion: RB, RP
        - Rediscussion next week?
    - RB: suggest: parallel programming simpler exercises
        - vote: yes: RB (Pedro is stil boss though)
        - vote: no:
        - vote: No opinion: RP, BC
        - Rediscussion next week. YES
    - RB: suggest: what is the goal of the course? If it is an introduction, does this include topics like parallel computing and GPU? Where to draw the line?
        - Moved to future meeting
        - ?What people want
        - RP: Machine Learning out next time (RB agrees)
        - Note that Python has advertised less, so there is more freedom there. Will be discussed with the Python group
- python 
    - end 16.00 :+1: 
        -  decided
      
    - New meeting
        - schedule
            - timings
            - login at 9:15
            - ordinary starts at 10.00
        - [x] [DONE BY BC] RB will send a Doodle for Python-only meeting
        - [ ] RB will prepare a draft schedule to be discussed
    - 30 min jupyter+interactive
        - postpone to meeting
- R
    - NEW: 
        - end at 16.00 instead of 15:00
            - Expected to win 30 mins, due to login session from 9:15-10:00, as course material can be removed
    - parallel went too fast
    - more time with ML
        - Or, instead, reduce Machine Learning (RB agrees, RP agrees)
    - more time for questions
    - [x] [DONE BY BC] RB: schedules R meeting
    - [ ] RB: proposes draft schedule
    - evaluations
- Julia
    - NEW:
        - end at 16.00 instead of 15:00
            - Expected to win 30 mins, due to login session from 9:15-10:00, as course material can be removed
    - Intro sessions and batch took longer time
    - meeting
        - BC calls
        - see above for topics covered
- Matlab (BC, RP, BB, PO)
    - meeting (what date range?)
        - [ ] RP creates schedules a date using a Doodle-like thing
        - see above

### ToDos
    - move some of the material to extra reading? check possibility -> goal less talk
    - more time for exercises

## Meeting  6 Sep 10:30-12:00

1. Review of decisions/updates
    - overall: 
        - evaluations keep improving
            - Ri: is there a plot/analysis somewhere? 
            - Bj: Yes, below. They are not on the GitHub yet, Ri volunteers to put it there too
        - more time for exercises
        - run as before (Rackham/Keb) but add possibility for Lunarc
            - how to do practically?
            - use prereq as to be able to log in and start the different interpreters on their favourite cluster 
                - yes Björn expands
                - sounds reasonable
            - Option 1: 3 parallel sessions of login 15 min right after intro
                - yes
                - no: Ri (no need for parallel, 15mins is too short), BC
                - together with tabs: BB, RP(?),PO
            - 
            - Option 2: at 8:30: first 45 mins (or shorter: depend on teacher) is always login, learners can choose to be absent on 2nd, 3rd, 4th day. After that leaners are assumed to be able to login. 9.15 ordinary proagram
                - Yes: BB (but prefer option 3), BC, PO half (if we skip the on-boarding)
                - No: Ri (too early), RP, PO half (if we have on-boarding)
            - Option 3: at 9:00, first 45 mins (or shorter: depend on teacher) is always login, learners can choose to be absent on 2nd, 3rd, 4th day. After that leaners are assumed to be able to login.
                - Yes: Ri, RP (this or Op. 1, I don't know which is better), BB half
                - No: BC
            - Starting of ordinary program each day
                - 10.00 after break
            - End each day at 16.00
                - yes: BC, Ri, RP, BB, PO
                - no:
        - move some of the material to extra reading? check possibility -> goal less talk
            - Yes: Ri, BC, BB,
            - No: 
            - I don't know: RP
    - prereq
        - email
            - most important info in top
            - update with Lunarc
            - BB goes through the text and try to shorten it
        - testable on prereq page
            - add login+load
    - [Move to next meeting] python 
        - end 16.00 :+1: 
            -  (other days as well?)
        - fix schedule
        - 30 min jupyter+interactive
        - R: suggest: simplify interactive session to single-node job: it is an intro
        - R: suggest: more time for sbatch and GPU
        - R: suggest: parallel programming simpler exercises
        - R: suggest: what is the goal of the course? If it is an introduction, does this include topics like parallel computing and GPU? Where to draw the line?
    - [Move to next meeting] R 
        - parallel went too fast
        - more time with ML
        - more time for questions
    - [Move to next meeting] Julia
        - Intro sessions and batch took longer time
2. Course projects
    3. seems we have lunarc users
        - probably can get cosmos project
        - also for teachers
        - gpu can be reserved: Jonas writes "I think you will need to adjust your examples, but short examples should be able to be run [on] a single GPU server. We could use the GPUs on the A40 nodes; then we don't have to reserve dedicated GPU-nodes."
4. Other evaluation questions?
    - R: yes, I like 'rate your confidence in ... ' questions, e.g. at  https://github.com/UPPMAX/uppmax_intro_day_1/tree/main/evaluations/20240827
5. Review of responsibilities+content
- Discuss:
    - maximum teachers per day
        - suggestion 2 or 3 or infinite
            - not important/infinite: Ri, BC, BB, RP, PO
            - 2
            - 3
    - maximum days of teaching per teacher
        - suggestion 3 or even 2 (if possible)
            - 2
            - 3: BC
            - infinite/4 no opinion (whatever works/is needed): Ri, RP, BB, PO
- Topics /schedule
    - PY: Ri, RP, BB PO
    - Julia: BC PO
    - R: BB, Ri, PO
    - MATLAB: RP, BC, PO, BB 
6. Detailed evaluations (if time) of 
- put up on github
- Student evaluations:
    - [Python (summary)](https://forms.office.com/Pages/AnalysisPage.aspx?AnalyzerToken=gYUW4FOr3fmmsYmBv20YfsRGEQUDXKUw&id=-aZLWjH1Mk-UZzmPGead5I9DA_EX6qtGpq8zJf2ohI1UMVpNM1dGUEhPVFpKUDVOUlBRWkgyUFlWMi4u), [Full evaluation/excel](https://docs.google.com/spreadsheets/d/13ABmZYPvu2orCWrKi8FL3QOlKGr9a_We/edit?usp=drive_link&ouid=100432443967881740194&rtpof=true&sd=true)
    - [Julia](https://forms.office.com/Pages/AnalysisPage.aspx?AnalyzerToken=gYUW4FOr3fmmsYmBv20YfsRGEQUDXKUw&id=-aZLWjH1Mk-UZzmPGead5I9DA_EX6qtGpq8zJf2ohI1UNlY3NFUwODFMWDlDVFhUUkRMS01CSkQzSS4u), [Full evaluation/excel](https://docs.google.com/spreadsheets/d/1LhDTDr48cdk3vNoREoVi9zN1qTm4eZeb/edit?usp=drive_link&ouid=100432443967881740194&rtpof=true&sd=true)
    - [R](https://forms.office.com/Pages/AnalysisPage.aspx?AnalyzerToken=gYUW4FOr3fmmsYmBv20YfsRGEQUDXKUw&id=-aZLWjH1Mk-UZzmPGead5I9DA_EX6qtGpq8zJf2ohI1UQ0NUU1pWQ0taNlE2V0JRUllDQlMwMkdXSi4u), [Full evaluation/excel](https://docs.google.com/spreadsheets/d/1prkvX3CF4IRsUnAfzoO1BLrw0TzQbwYN/edit?usp=drive_link&ouid=100432443967881740194&rtpof=true&sd=true)


5. Next meetings 
    - language specific?
        - yes: Ri
        - no: always start with general things and see how it progresses, maybe schedule small meetings if need: 
            - BC, PO, RP, BB
    - every friday 11.00-12.00
        - agenda
            1. general
            2. python 
            3. R
            4. Matlab
            5. Julia
        - ad-hoc meetings
6. ToDos
    - BC:
        - matlab material
        - prereqs
    - BB:
    - PO:
    - RB: get evaluation data, suggest schedules for Py and R
    - RP:

## 


## Meeting 19 Aug, 13-14 Focus MATLAB

Zoom: https://umu.zoom.us/j/61208880201 

- Look-up before: 
    - VS code implementation
        - there is extension
    - gurobi/comsol/other?
    - home desktop
        - works on UPPMAX (batch part, not pool)
        - documentation soon updated

#### Content
- Fill in here: https://github.com/UPPMAX/R-python-julia-HPC/tree/main/docs/matlab
- Intro
    - [name=Rebecca]
- load/run
    - [name=Rebecca]
    - shell scripts
    - thinlinc
- add-ons/packages
    - [name=Björn]
- slurm (matlab agnostic)
    - [name=Birgitte]
- parallel (can be divided)
    - syntax
    - pool
    - matlab batch
    - shell batch
    - [name=Pedro]
- GPU
    - [name=]

- PARALLEL SESSIONS
    - desktop on demand (COSMOS)
        - [name=Rebecca]
    - local desktop (UPPMAX)
        - [name=Björn]
    - (jupyter notebook)
        - [name=Pedro] 
- interaction with other tools (brief)
    - [name=]
- 

#### Matlab on different systems
- Tetralith: https://www.nsc.liu.se/software/installed/tetralith/matlab/
- Kebnekaise: (config) https://www.hpc2n.umu.se/resources/software/configure-matlab-2018 (running) https://www.hpc2n.umu.se/resources/software/matlab
- Lunarc ondemand: https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/MATLAB/
- Alvis: https://www.c3se.chalmers.se/documentation/applications/matlab/


#### ToDo:s
- [x] add matlab in repo name?
- Ask Joachim and Magnus about cosmos GPU configs and whether we can use cosmos for the course - settings fixed at https://lunarc-documentation.readthedocs.io/en/latest/manual/submitting_jobs/manual_specifying_requirements/#accessing-gpus
- Course projects on?
    - UPPMAX/Rackham-Snowy for all NAISS users
    - HPC2N/Kebnekaise for HPC2N users
    - LUNARC/Cosmos for Lund users 
- Different ways of running MATLAB between OnDemand Desktop on COSMOS vs Tetralith, UPPMAX, etc.

### Python (Tuesday 2024-10-22)

Time     |Topic                      |Teacher
---------|---------------------------|-------
**9.00** |Syllabus                   |Rebecca
**9.10** |Python in general          |Rebecca
**9.20** |Load modules and run       |Rebecca
**9.45** |Break                      |.
**10:00**|Packages  (45-->30)        |Richel
**10.30**|Break                      |.
**10.45**|Isolated environments (ML, venv, **conda**)|Richel (45-->60)
**11:45**|Break or informal chat     |Richel 
**12.00**|Lunch                      |.
**13.00**|Batch                      |Birgitte
**13:20**|GPU                        |Birgitte
**13.30**|Kebnekaise: Jupyter        |Birgitte
.        |Rackham:  Interactive session and Jupyter         |Richel
**13.45**|Break                      |.
**14.00**|Parallel and multithreaded functions|Pedro
**14.25**|Conclusion & Q/A           |Birgitte
**14.45**|.                          |.
**15.00**|END 

### Julia (Wednesday 2024-10-23)

Time     |Topic                              |Teacher
---------|-----------------------------------|-------
**9.00** |Syllabus    7                      |Björn
**9.10** |Intro, Julia in general 23         |Pedro
**9.30** |Load modules and run   16          |Björn
**9:45** |Break                              |.
**10:00**|Packages and isolated 47           |Pedro (and Björn)
**11:00**|Break                              |.
**11:15**|Parallel+multithreaded functions 30|Pedro
**11.45**|Break or informal chat or exer     |all?
**12.00**|Lunch                              |.
**13.00**|Batch and GPU     46               |Pedro
**13.50**|Break                              |.
**14.00**|UPPMAX: Jupyter and interactive 25 |Björn
.        |HPC2N: Jupyter                     |Pedro
**14.25**|Conclusion and summary, Q/A        |Björn
**14.35**|.                                  |.
**14.45**|Q/A                                |.
**15.00**|END                                |.

### R (Thursday 2024-10-24)

Time     |Topic                            |Teacher
---------|---------------------------------|-------
**9:00** |Syllabus                         |Richel
**9:10** |R in general                     |Richel
**9:20** |Load modules and run             |Richel
**9:45** |Break                            |.
**10:00**|Packages                         |Birgitte
**10:30**|Break                            |.
**10:45**|Kebnekaise, ThinLinc & RStudio   |Pedro
.        |UPPMAX: ThinLinc, RStudio, inter-|Richel <--- NEW
**11:15**|Parallel                         |Pedro
**11:50**|Break or informal chat           |All
**12:00**|Lunch                            |.
**13:00**|Isolated environments            |Birgitte
**13:20**|Batch                            |Birgitte
**13:50**|Break                            |.
**14:00**|ML                               |Birgitte or Pedro <--- NEW
**14:35**|Conclusion & Q/A                 |All
**14:45**|Evaluation                       |.
**15:00**|END                              |.

### Matlab (Friday 2024-10-25)

Time     |Topic                            |Teacher
---------|---------------------------------|-------
**9:00** |Syllabus                         |

### Meeting 20 May
- Typical sessions
    - load, run, scripts, thinlinc
    - packages/plug-ins
        - check vs code implementation
            - https://content.mathworks.com/viewer/6616d1a654a921f7493cf4f6
        - gurobi/comsol etcetra
    - isolated? check
    - batch
    - interactive
    - parallelisms
    - gpus
    - ML
