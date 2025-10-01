# Matlab - extra reading and links

## Documentation

- Documentation at the HPC centres UPPMAX, HPC2N, LUNARC, NSC, and PDC
   - UPPMAX: http://docs.uppmax.uu.se/software/matlab/
   - HPC2N: https://www.hpc2n.umu.se/resources/software/matlab and https://www.hpc2n.umu.se/documentation/guides/parallel-matlab
   - LUNARC: https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/MATLAB/
   - NSC: click [here for general instructions](https://www.nsc.liu.se/software/docs/matlab/) and [here for installations on Tetralith](https://www.nsc.liu.se/software/catalogue/tetralith/modules/matlab.html) specifically
   - PDC: https://support.pdc.kth.se/doc/applications/?sub=matlab/
- Official MATLAB documentation is found [here](https://se.mathworks.com/help/matlab/index.html?s_tid=hc_panel)

## Courses - improving your programming skills

If you have a Mathworks account that is less than 2 years old, Mathworks offers free [MATLAB self-paced online training courses](https://matlabacademy.mathworks.com/?page=1&fq=all-matlab&sort=featured&s_tid=ln_acad_learn_oc). Students at any academic institution with a campus-wide license can use their university email addresses to create a free account to access these resources.

The Mondays with MATLAB lecture series is offered every September, and offers introductions to MATLAB, its Parallel Computing Toolbox, and AI/ML toolboxes. These and other events are posted [here](https://se.mathworks.com/company/events.html). If you have an account, you will be automatically signed up for the Mathworks mailing list, which will notify you of upcoming webinars as well as some featured packages. The webinars cover a broad range of topics and disciplines at varying skill levels, although these seminars tend to be more advanced.

## Debugging

If a serial job produces an error, call the getDebugLog method to view the error log file.  When submitting an independent job, specify the task.

```{ .matlab }
>> c.getDebugLog(job.Tasks)
```

For Pool jobs, only specify the job object.

```{ .matlab }
>> c.getDebugLog(job)
```

When troubleshooting a job, the cluster admin may request the scheduler ID of the job.  This can be derived by calling getTaskSchedulerIDs (call schedID(job) before R2019b).

```{ .matlab }
>> job.getTaskSchedulerIDs()
ans =
    25539
```

## Parallel computing 

To learn more about the MATLAB Parallel Computing Toolbox, check out these resources:

- [Parallel Computing Coding Examples](https://www.mathworks.com/help/parallel-computing/examples.html)
- [Parallel Computing Documentation](http://www.mathworks.com/help/distcomp/index.html)
- [Parallel Computing Overview](http://www.mathworks.com/products/parallel-computing/index.html)
- [Parallel Computing Tutorials](http://www.mathworks.com/products/parallel-computing/tutorials.html)
- [Parallel Computing Videos](http://www.mathworks.com/products/parallel-computing/videos.html)
- [Parallel Computing Webinars](http://www.mathworks.com/products/parallel-computing/webinars.html)


## Interaction with other tools

Coming?


## Add-ons

!!! admonition "Some toolboxes"

    - Matlab products
        - Parallel Computing Toolbox
        - MATLAB Parallel Server
        - Deep Learning Toolbox
        - Statistics and Machine Learning Toolbox
    - Simulink
        - Stateflow
        - SimEvents
        - Simscape

!!! admonition "Some toolboxes provides **GUI** for their tools Apps"

    - Matlab products
        - Deep Network Designer - Design and visualize deep learning networks Deep Network Designer
        - Curve Fitter - Fit curves and surfaces to data
        - Deep Learning Toolbox
        - Statistics and Machine Learning Toolbox
    - Simulink
        - Stateflow
        - SimEvents
        - Simscape

![Apps](./img/apps.PNG)
