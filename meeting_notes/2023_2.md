


# Autumn 2023
## Dates
* 17-19 October
* py, jl, R
* 9-15

## Debriefing Python day 8 Nov 11.00

Present: Bj and R

- [Evaluation](https://forms.office.com/Pages/AnalysisPage.aspx?AnalyzerToken=gYUW4FOr3fmmsYmBv20YfsRGEQUDXKUw&id=-aZLWjH1Mk-UZzmPGead5I9DA_EX6qtGpq8zJf2ohI1URVZPSUFDRlpCV1BUNzIyQzY1V0pPSFVKUi4u)
- [marked summary](https://docs.google.com/document/d/1K7aw4LxL-PCT6xU3HWs_WTFuvOIc1h35fzj3TzN9p-E/edit?usp=sharing)
- Learnings
    - continue
        - friendly
        - easy asking questions: also thanks to breakout rooms!
        - material
        - structure
    - change?
        - make clear in advertisement that packages are a big part in this workshop
             - more HPC in the HPC-python
        - BO:s 
            - checking in more frequently: we did well enough
            - more flexible in returning to main room: we felt the setup was fine if the times are better matched to the exercise length
            - have voluntary exercise rooms: we felt the breakout rooms worked fine, if the times are better matched to the exercise length
          - [AGREED] use a silent room
      - No time to cover all material
         - More to extra reading!
         - More time on code-along and exercises: will work when timing of the course matches the observed exercise durations; this will free up 25 mins
- Use more videos; both Bj and R think videos are a useful alternative over a monologue
    - Bj comment and opinion: 
      - videos perhaps not in lecture
      - but available as recordings (like before) and session-sliced and available as links on each session page?
- [AGREED] Suggest different lengths:

Topic   |Was scheduled|Actual time used|Suggested time
--------|-------------|----------------|--------------
packages|45 mins      |15 mins         | 30 mins
venv    |45 mins      |15 mins         | 30 mins
Jupyter |15 mins      |15 mins         | 15 mins
conda   |25 mins      |25 mins         | 30 mins

* [AGREED (implicitly)] Have a pre-course login session for those that need it
 * [AGREED (implicitly)] No Zoom chat, only use shared document
 * [AGREED (implicitly)] No anonymous evaluation needed if the Google Form is so good
 * [DONT: this would only work well for UPPMAX users] Suggest to follow this students' suggestion: 
     * 'The first should be how to run a simple script. "batch mode" should come before "virtual environments".  Also, avoid "pip" at the start, take that later since modules are enough for standard tasks'
 * General comments from BB:
     *  Yes to the pre-course session for onboarding etc.
     *  Yes to use Q/A document instead of Zoom chat
     *  Google form seems to be enough for evaluation purposes, yes
     *  Strongly NOT agreeing on the more videos - if we do, they should be shown in the main room and be strictly the lecture we would otherwise have held (and then I would favour flipped classroom instead of having a course where people just come and watch a video and then we do exercises or whatever). 
     *  There seemed to be unhappiness about the "go to zoom room" -> "go to YouTube and watch a video and then do the exercises there" -> "go back to main room and see lectures etc."

### Planning for next workhop
- Suggested month 
    - Feb/March
- Suggested teachers
    - py: 
        - Richel: willing to teach whole day if needed, same for being helper
    - jl:
        - Björn in some parts
    - R: 
        - Richel: willing to be a helper whole day, but open to teach if needed
        - Björn interested


## Follow-up after first day

### Learnings
- Batch takes longer time! 30-->45
- Parallel need longer time! 25-->35?

### Changes for julia
- Package+isolated  30 min
- Packages and isolated  
- 10 min evaluation

### Changes for R
- Package 30 min
- Isolated 30
- 10 min evaluation


### Julia (Wednesday 2023-10-18)

Time     |Topic                      |Teacher
---------|---------------------------|-------
**9.00** |Syllabus                   |Björn
**9.10** |Intro, Julia in general    |Pedro
**9.30** |Load modules and run       |Björn
**10:00** |Break                      |.
**10:15**|Packages and isolated      |Pedro (and Björn)
**11:00**|Break                      |.
**11:15**|Parallel and multithreaded functions|Pedro
.        |Bianca packages             |Björn
**11.50**|Break or informal chat or exer|all?
**12.00**|Lunch                      |.
**13.00**|Batch and GPU              |Pedro
**13.45**|Break                      |.
**14.00**|UPPMAX: Jupyter and interactive |Björn
.        |HPC2N: Jupyter             |Pedro
**14.25**|Conclusion and summary, Q/A|Björn
**14.35**|Evaluation                 |Anon [R volunteers]
**14.45**|Q/A                |Anon [R volunteers]
**15.00**|END                        |.

### R (Thursday 2023-10-19)

Time     |Topic                      |Teacher
---------|---------------------------|-------
**9.00** |Syllabus                   |Björn
**9.10** |R in general               |Björn
**9.20** |Load modules and run       |Björn
**9.45** |Break                      |.
**10:00**|Packages                   |Birgitte
**10.30**|Break                      |.
**10.45**|Isolated environments      |Birgitte
**11.15**|Kebnekaise: Parallel    |Pedro
.        |*UPPMAX: Bianca*       | Björn
**11:50**|Break or informal chat     |All
**12.00**|Lunch                      |.
**13.00**|Batch                      |Birgitte
**13:20**|Parallel, ML               |?
**13.30**|Kebnekaise, ThinLinc & RStudio|Pedro
.        |UPPMAX: ThinLinkn, RStudio, inter-|Björn
**13.45**|Break                      |.
**14.25**|Conclusion & Q/A           |All
**14.45**|Evaluation                 |Anon [R picks someone]
**15.00**|END                        |.


## Next meeting Mon 16 Oct 11.00
- Status
    - all OK with parallel session materials
        - R: not yet, working on it, will be ready, hence probably not in meeting. Looking forward to tomorrow :-) !
        - R: to overcommunicate, for tomorrow: as agreed upon earlier, in the session 'Isolated environments' 11:00-11:45 I will only do `virtualenv`, as that works on both clusters. Conda is in a parallel session at 14:00.
            - [x] BC: I move the conda part in material then to afternoon! If you don't do it first!
            - [x] BC: Conda is removed from packages but available in condaUPPMAX. I kept an introduction in the packages session and gave a link to the afternoon.
            - [X] BC: Updating schedule
    - R: To overcommunicate: evaluator at 14:45 has been arranged (Wednesay and Thursdays R will do it). Using a person and doing an evaluation under course time has given 24 out of approx 27 responses [in another course](https://github.com/NBISweden/workshop-python/blob/ht23/evaluation/Intro%20to%20Python%202023%20evaluation.csv)

- To discuss
    - same presentation style?
        - half screen with material + terminal + history
    - shell-sharing: https://enccs.github.io/instructor-training/teaching-mechanics/#shell-sharing
    - R: I think this is a good idea, so I will try to do this most of the time. On the other hand, I feel each teacher should be free to do what he/she prefers 
        - we do as we prefer!

User
```bash
╔════════════╗ ╔══════════════╗
║            ║ ║  TERMINAL    ║
║            ║ ║   WINDOW     ║
║   ZOOM     ║ ╚══════════════╝
║  WINDOW    ║ ╔══════════════╗
║            ║ ║   BROWSER    ║
║            ║ ║  W/MATERIAL  ║
╚════════════╝ ╚══════════════╝
```
Teacher (sharing left/right portion of screen)
```bash
╔══════════════╗
║   BROWSER    ║
║  W/MATERIAL  ║
╚══════════════╝
╔══════════════╗
║  TERMINAL    ║
║   WINDOW     ║
╚══════════════╝
╔══════════════╗
║  HISTORY     ║
║   WINDOW     ║
╚══════════════╝

```

## Meeting Tue 10 Oct 15.00
- To discuss
    - DASK?
        - Is installed in py3.11 on UPPMAX
        - just mention this time?
        - include in hpc-python Dec 1?
  

- ToDos
    - [ ] Björn checks everything is working on UPPMAX
    - [x] First page common for all days
        - changes, shortenings
        - code of conduct 
    - [x] Björn COMMON
        - parallel
            - add dask+links in the end
    - [x] Björn: list of links to centres
        - langauage specific + common
    - [x] Björn: courses at all levels in a good format


- Status
    - exercises?
        - start!
    - discussions?
        - perhaps not
    - [x] can we copy the parallel?
      - or put under a menu-bar header "COMMON" or something else. YES
      - 
      
- Workshop days
    - BO rooms
        - silent
        - many rooms for exercises
        - interaction room
            - force: works!



## Next meeting Thu 28 Sep 13.00
- To discuss:
    - evaluation in lesson-time?
    - Publish results in raw form online?
- Status

## Schedule for the fall 2023 version

### Python (Tuesday 2023-10-17)

Time     |Topic                      |Teacher
---------|---------------------------|-------
**9.00** |Syllabus                   |Birgitte
**9.10** |Python in general          |Birgitte
**9.20** |Load modules and run       |Birgitte
**9.45** |Break                      |.
**10:00**|Packages                   |Richel
**10.45**|Break                      |.
**11.00**|Isolated environments      |Richel
**11:45**|Break or informal chat     |Richel 
**12.00**|Lunch                      |.
**13.00**|Batch                      |Birgitte
**13:20**|GPU                        |Birgitte
**13.30**|Kebnekaise: Jupyter        |Birgitte
.        |Rackham: Jupyter           |Richel
**13.45**|Break                      |.
**14.00**|Parallel and multithreaded functions|Pedro
.        |Bianca: Conda, interactive|Richel
**14.25**|Conclusion & Q/A           |Birgitte
**14.45**|Evaluation                 |Anon [R picks someone]
**15.00**|END                        |.

### Julia (Wednesday 2023-10-18)

Time     |Topic                      |Teacher
---------|---------------------------|-------
**9.00** |Syllabus                   |Björn
**9.10** |Intro, Julia in general    |Pedro
**9.30** |Load modules and run       |Pedro
**10:00** |Break                      |.
**10:15**|Packages and isolated      |Pedro and Björn
**11:00**|Break                      |.
**11.15**|Exercises and informal chat|All 
**12.00**|Lunch                      |.
**13.00**|Batch and GPU              |Pedro
**13.30**|UPPMAX: Jupyter and interactive |Björn
.        |HPC2N: Jupyter             |Pedro
**13.45**|Break                      |.
**14.00**|Parallel and multithreaded functions|Pedro
.        |Bianca packages |Björn
**14.25**|Conclusion and summary, Q/A|Björn
**14.45**|Evaluation                 |Anon [R volunteers]
**15.00**|END                        |.

### R (Thursday 2023-10-19)

Time     |Topic                      |Teacher
---------|---------------------------|-------
**9.00** |Syllabus                   |Björn
**9.10** |R in general               |Björn
**9.20** |Load modules and run       |Björn
**9.45** |Break                      |.
**10:00**|Packages                   |Birgitte
**10.45**|Break                      |.
**11.00**|Isolated environments      |Birgitte
**11:45**|Break or informal chat     |All
**12.00**|Lunch                      |.
**13.00**|Batch                      |Birgitte
**13:20**|Parallel, ML               |?
**13.30**|Kebnekaise, ThinLinc & RStudio|Pedro
.        |UPPMAX: ThinLinkn, RStudio, inter-|Björn
**13.45**|Break                      |.
**14.00**|Kebnekaise: Parallel    |Pedro
.        |UPPMAX: Bianca        | Björn
**14.25**|Conclusion & Q/A           |All
**14.45**|Evaluation                 |Anon [R picks someone]
**15.00**|END                        |.

### Next meeting: 
10th October 2023, 15:00-16:00 
 

## Python-specific meeting 19 Sep 13.00-13.30
- Differences between clusters 
  - Do all students work on the same cluster: no
  - Is it possible to get access to HPC2N: yes, B will add R
  - Course material shows differences in tabs versus links? Decision: three tabs, 1 for UPPMAX, 1 for HPC2N, links in third tab
  - Interactive jobs work best at UPPMAX, at end for UPPMAX only
- Preparation
  - B sets up Zoom room, will be recorded, sent to YouTube channel, B edits movie as well :-)
- Planned changes
  - More exercises for the quicker students: R and B will add for own sessions
  - Assume students learn Python themselves
  - Decision: Add parallel intro material, by Pedro. B asks Pedro
  - Decision: Add GPU intro material, by Birgitte
- Teaching schedule (see schedule below)
    - R and B will discuss on SNIC Slack
    - TODO R: Scheduling 11:30 'Catching up' makes no sense: talk less and/or have less exercises instead. Or phrased differently: what would the learning outcome be of 'Catching up'?
    - TODO R: vote: 15 mins break, scheduled at `x:45-y:00` (also from 11:45-12:00!)
    - TODO R: I need 5 mins for the syllabus. Why is `+thinlinc` in the schedule at 'Intro syllabus'?
    - TODO R: It feels needlessly clumsy that there are two teacher switches in the first 45 mins. What about one teacher does the full first 45 mins?
    - TODO R: same needless switching for 13:00-13:50 (and why `50`, instead of `45`?)
    - TODO Teach both `conda` (Binca only) and `venv`/`virtualenv`. `conda` is only for Bianca, so fewer students expected
- Evaluations
    - R: Earlier evaluations: 
        - Where can we find them? B sends R the CSV file
        - At the end of the third day
    - R: When? For example, at the end of every day?
        - At the end of 3rd day or every day?
        - Vote: Split up: Richel, 
        - Actual vote at bigger meeting, B will (re)schedule and bring it up
    - R: Publish results in raw form online
        - Actual vote at bigger meeting and bring it up

### Present schedule

Suggested Python schedule by R&B (old is below this one):

Time     |Topic                      |Teacher
---------|---------------------------|-------
**9.00** |Syllabus                   |B
**9.10** |Python in general          |B
**9.20** |Load modules and run       |B
**9.45** |Break                      |.
**10:00**|Packages                   |R
**10.45**|Break                      |.
**11.00**|Isolated environments      |R
**11:45**|Break or informal chat     |R 
**12.00**|Lunch                      |.
**13.00**|Batch                      |B
**13:20**|GPU                        |B
**13.30**|Kebnekaise: Jupyter        |B
.        |Rackham: Jupyter           |R
**13.45**|Break                      |.
**14.00**|Parallel and multithreaded functions|Pedro
.        |Bianca: Conda, interactive|R
**14.30**|Conclusion                 |B
**14.45**|Evaluation                 |Anon [1]
**15.00**|END                        |.

 * [1] A person that the students have never met yet, to ensure a proper anonymous evaluation. R will recruit
 * Zoom: 1 silent room

OLD:

|Topic|Suggested Timing|Comment|Teacher|
|-----|--------|-|-| 
|**9.00** Index intro|15|+ thinlinc |Richel|
|**9.15** Intro to python|10|Keep detailed schedule and link to HackMD|Birgitte|
|**9.25** Load and run|20|(can be shorten to 15m perhaps)|Richel|
**9.45** Break| 15
|**10:00** Packages|25| |Richel|
**10.45** break| 15
|**11.00** Isolated environments| 30| | Richel
|**11:30** Catching up and exercises|30|
|**12.00** Lunch| 60
|**13.00** Batch|25|| Birgitte
|**13.25** Jupyter with remote desktop|25| |Richel and Birgitte in parallel session
|**13.50** break| 15
**14.05** Parallel function intro|15|**NEW**|
|END Interactive session on command-line (UPPMAX only)|25| |Richel
|END Packages: Conda|20| |Richel
|**14.20** Summary|10||Richel|
|**14.30** Catching up, questions and exercises| 30||All
**15.00** END





## Next meeting Fri 15 Sep 11.00

- [x] Richel assumes to teach Python on Oct 17th
- [x] Richel added spellcheck and linkcheck GH-actions
    - https://github.com/UPPMAX/R-python-julia-HPC/tree/main/.github/workflows
* Status
    - project is active

- Todo:s
    - Reservation [name=Diana]
    - change start date to asap, but keep end date as Nov 1 [name=Diana]

## Next meeting Wed 6 Sep 10-11
- keep version? 
    - py3.9.5 or newer
        - check packages until next meeting
        - 3.10.X?
    - same for R and Julia
    - R/4.0.4
        - 4.1.2 Keb
        - 4.1.1 Rac
    - julia/1.8.5
        - stick with this, not very old
- 'til next time
    - add GPU R??
    - start thinking of the parallel intro material
- projects
    - rackham
    - snowy + reservation
    - kebne

## Timings
### Python

- Table is based on 9.00-12.30 and 1x15 + 2x5 min breaks
- modified to 9-15

|Topic|Suggested Timing|Comment|Teacher|
|-----|--------|-|-| 
|Index intro|15|+ thinlinc |Richel|
|Intro|10|Keep detailed schedule and link to HackMD|Birgitte|
|Load and run|20|(can be shorten to 15m perhaps)|Richel|
|Packages|25| (buffert time)|Richel|
|Packages: Conda|20| |Richel
|Isolated| 30| Plan for extra time as we do it together| Richel
|Catching up and exercises|30|
|Lunch
|Batch|25|slightly more effective| Birgitte
|Interactive, more jupyter|25| |Richel
|Parallel intro|15||
|Summary|10||Richel|
|Questions|15||All 
|Catching up and exercises| 20||All

### Julia

- Table is based on 9.00-12.30 and 1 15 +2 5 min breaks
- short intro to parallel
- include jupyter

|Topic|Suggested shortening|Comment|Teacher|
|-----|--------|-|- 
|Index intro|5|10|Move some practical to overview|Björn
|Intro|10||Pedro
|Load and run|20|(can be shorten to 15m perhaps)|Pedro
|Isolated| 30| Plan for extra time as we do it together| Pedro
|Packages at UPPMAX|20| (buffert time)| Björn
|Batch|25|slightly more effective|Pedro
|Interactive|15||Björn
|Exercises| 20||All
|Summary| 10| |Pedro + Björn
|Questions|?|10 ||All

### R
- End already at 12?
- proposed R scheddule:
https://uppmax.github.io/R-python-julia-HPC/R/intro.html
- Table is based on 9.00-12.00 and 1x15 + 1x5 min breaks


|Topic|HPC-Python|Suggested timing|Comment|Teacher|
|-----|----------|--------|-|- 
|Index intro|10|Move some practical to overview|Matias|
|Intro|10|Keep detailed schedule and link to HackMD|Matias
|Load and run|20|(can be shorten to 15m perhaps)|Birgitte
|Packages|20| (buffert time)|Birgitte
|Isolated|5-10|renv + mention Conda| Matias
|Batch incl GPU|25|slightly more effective|Birgitte
|Interactive| 15?| |Matias
|ThinLinc+RStudio| 10-15 | | Matias
|Exercises|  20||All
|Summary|  10| |Matias
|Questions|10 ||All



## Meeting 11 Aug
- Changes
  - more HPC?
      - not parallel
      - mention gpu also for R
  - more exercises!
    - extra time in the end (1 hr or so)
  - assume students attend prereqs
      - basic programming Python
          - CodeRefinery https://coderefinery.github.io/data-visualization-python/python-basics/
          - UPPMAX https://uppmax.github.io/uppmax_intro_python/
          - Scicomp Aalto intermediate https://scicomp.aalto.fi/training/scip/python-for-scicomp-2022/
      - Julia
          - aalto  https://github.com/AaltoRSE/julia-introduction
          - enccs 
          - caRPENTRY https://carpentries-incubator.github.io/julia-novice/
      - R
          - carpentry https://swcarpentry.github.io/r-novice-gapminder/index.html
      - intro course text material (recordings for Kebnekaise?)
          - linux
          - slurm

  - how to do on other Naiss systems
      - tabs
      - or cheat sheets
- web site
    - UNIVERSITY
    - GITHUB: INCLUDE REGISTRATION LINKS

- Last course 45 in total
  - py: c. 40
  - jl: c. 15 --> 8
  - R: c. 30
