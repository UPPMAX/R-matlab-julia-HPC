# On Demand Applications

!!! important "Learning Objectives"

    - What are On-Demand applications and when to use it
    - Which interface to use on each resource and how to start them
    - How to set the job parameters for your application

## What is Desktop On Demand? Is it right for my job?

On Cosmos (LUNARC), Kebnekaise (HPC2N), and Dardel (PDC), some applications are available through one of several On Demand services. On Demand applications provide an interactive environment to schedule jobs on compute nodes using a graphic user interface (GUI) instead of the typical batch submission script. How you reach this interface is dependent on the system you use and their choice of On Demand client.

- **Cosmos** and **Dardel** use the On-Demand Desktop developed at LUNARC, which is accessible via Thinlinc.
- **Kebnekaise** uses Open OnDemand[^1] via a dedicated web portal at [https://portal.hpc2n.umu.se](https://portal.hpc2n.umu.se).

Desktop On-Demand is most appropriate for *interactive* work requiring small-to-medium amounts of computing resources. Non-interactive jobs and jobs that take more than a day or so should generally be submitted as batch jobs. If you have a longer job that requires an interactive interface to submit, make sure you keep track of the wall time limits for your facility.

On-Demand applications are *not* accessible via SSH; you must use either Thinlinc (Cosmos and Dardel) or the dedicated web portal (Kebnekaise).

[^1]: Open OnDemand is a web service that allows HPC users to schedule jobs, run notebooks and work interactively on a remote cluster from any device that supports a modern browser. The Open OnDemand project was funded by NSF and is currently maintained by the Ohio SuperComputing Centre. Read more about [OpenOndemand.org](https://openondemand.org/).

!!! info "On-Demand App Availability for this Course"

    - RStudio and MATLAB are both available as On-Demand applications at all 3 facilities covered on this page.
    - The same facilities also provide Jupyter Notebook and/or Jupyter Lab On-Demand if you wish to use IJulia.
    - On Cosmos, there are also interactive On-Demand command lines (for CPUs and GPUs) under `Applications - General` that you may want to use with Julia, or that may still let you use RStudio or MATLAB if for some reason those apps fail to start with the more direct methods described below.

!!! tip

    Batch jobs submitted from within these interactive sessions are *not* bound by the same job parameters as the On-Demand interface. E.g., if you are in the MATLAB GUI and submit a job with the `batch` command, the batch job will not be interrupted if the GUI is closed or times out.

!!! warning "Thinlinc Access Limited on Dardel (PDC)"

      Here we focus on Cosmos and Kebnekaise because access to Dardel via Thinlinc is severely restricted. Only 30 users total may have an active ThinLinc session at a time, and queue times are very long. Other PDC resources not tested in this course may be more flexible, but if you must run a program on Dardel interactively, it is better to use SSH with X-forwarding (that is, log in with `ssh -X <user>@dardel.pdc.kth.se`) and then [follow the workflow described in this link](https://support.pdc.kth.se/doc/run_jobs/run_interactively/).
      
      Keep in mind that if you do not need a full node, you can also select a number of cores on Dardel's `shared` partition, which may help reduce your time in the queue. See [here for information on Dardel partitions](https://support.pdc.kth.se/doc/run_jobs/job_scheduling/#dardel-partitions).

## Starting the On-Demand Interface

=== "COSMOS (and Dardel)"

    For most programs, the start-up process is roughly the same:

    1. Log into COSMOS (or Dardel) via your usual Thinlinc client or browser interface to start an HPC Desktop session.
    2. Click `Applications` in the top left corner, hover over the items prefixed with `Applications -` until you find your desired application (on Dardel, On-Demand applications are prefixed with `PDC-`), and click it. The top-level Applications menu on Cosmos looks like this:
    
        <div align="center">
          <img src="Cosmos-AppMenu.png" alt="Cosmos On-Demand applications menu" width="500"/>
        </div>
    
    !!! warning
    
        If you start a terminal session or another application from `Favorites`, `System Tools`, or other menu headings not prefixed with `Applications -` or `PDC-`, and launch an interactive program from that, it will run on a login node. Do not run intensive programs this way!

=== "Kebnekaise"

    To start an Open OnDemand session on Kebnekaise,
    
    1. Open [https://portal.hpc2n.umu.se](https://portal.hpc2n.umu.se) in your browser. The page looks like this:
    
        <div align="center">
          <img src="open-ondemand-portal.png" alt="HPC2N Open On-Demand Portal" width="500"/>
        </div>
    
    2. Click the blue button labeled "Login to HPC2N OnDemand".
    3. A login window should open with boxes for your login credentials. Enter your HPC2N username and password, then click "Sign In".
    4. You will now be on the HPC2N Open OnDemand dashboard. The top of it looks like this:
    
        <div align="center">
            <img src="open-ondemand-dashboard.png" alt="HPC2N Open On-Demand Portal" width="500"/>
        </div>
    
    5. Find the `Interactive Apps` tab in the menu bar along the top and click it to open a drop-down menu of available apps. The menu currently looks like this:
    
        <div align="center">
            <img src="open-ondemand-apps.png" alt="HPC2N Open On-Demand Apps" width="500"/>
        </div>
    
    !!! warning
    
        Unlike on Cosmos and Dardel, On-Demand applications on Kebnekaise are **not** reachable through Thinlinc, regardless of whether you use the desktop client or a browser! If you find similar-looking applications in the Thinlinc interface, be aware that they all run on login nodes!

## Setting Job Parameters

=== "COSMOS (and Dardel)"

    Upon clicking your chosen application, a pop-up interface called the **GfxLauncher** will appear and let you set the following options:
    
      #. **Wall time** - how long your interactive session will remain open. *When it ends, the whole window closes immediately and any unsaved work is lost.* You can select the time from a drop-down menu, or type in the time manually. On Cosmos, CPU-only applications (indicated with "(CPU)" in the name) can run for up to 168 hours (7 days), but the rest are limited to 48 hours. Default is 30 minutes.
      #. **Requirements** - how many tasks per node you need. The default is usually 1 or 4 tasks per node. There is also a **gear icon** to the right of this box that can pull up a second menu (see figure below) where you can set
      
          - the name of your job, 
          - the number of tasks per node, 
          - the amount of memory per CPU core, and/or 
          - whether or not to use a full node.
          
      #. **Resource** - which kind of node you want in terms of the architecture (AMD or Intel) and number of cores in the CPU (or GPU). Options and defaults vary by program.
      #. **Project** - choose from a drop-down menu the project with which your work is associated. This is mainly to keep your usage in line with your licenses and permissions, and to send any applicable invoices to the correct PI. Licensed software will only work for projects whose group members are covered by the license.

    <div align="center">
        <img src="Cosmos-OnDemand-Matlab23b-advreqs.png" alt="Cosmos Matlab On-Demand options" width="500"/>
    </div>
    
    > The GfxLauncher GUI (here used to launch MATLAB). The box on the left is the basic menu and the box on the right is what pops up when the gear icon next to `Requirements` is clicked.  

    When you're happy with your settings, click "Start". The GfxLauncher menu will stay open in the background so that you can monitor your wall time usage with the `Usage` bar. Leave this window open---your application depends on it!

    !!! warning
    
        Closing the GfxLauncher popup after your application starts will kill the application immediately!

    If you want, you can also look at the associated SLURM scripts by clicking the "More" button at the bottom of the GfxLauncher menu and clicking the "Script" tab (example below), or view the logs under the "Logg" tab.
    
    <div align="center">
      <img src="Cosmos-OnDemand-Matlab23b-more-script.png" alt="Cosmos Matlab On-Demand more script details" width="500"/>
    </div>
    
    If an app fails to start, the first step of troubleshooting will always be to check the "Logg" tab.
    
    !!! note "Terminals on Compute nodes"
    
        If you don't see the program you want to run interactively listed under any other `Applications` sub-menus, or if the usual menu item fails to launch the application, you may still be able to launch it via one of the terminals under `Applications - General`, or the GPU Accelerated Terminal under `Applications - Visualization`.
    
        The CPU terminal allows for a wall time of up to 168 hours (7 days), while the two GPU terminals can only run for 48 hours (2 days) at most. For more on the specifications of the different nodes these terminals can run on, see [LUNARC's webpage on COSMOS](https://www.lunarc.lu.se/systems/cosmos/).

    If you finish before your wall time is up and close the app, the app should stop in the GfxLauncher window within a couple of minutes, but you can always force it to stop by clicking the "Stop" button. This may be necessary for Jupyter Lab.

=== "Kebnekaise"

    If you select any of the options under "Interactive apps", a page will open that looks like this (using RStudio as an example):

    <div align="center">
      <img src="open-ondemand-Rstudio-options.png" alt="Open OnDemand RStudio options" width="500"/>
    </div>

    Most of the options you have to set will be the same whether you choose RStudio Server, MATLAB Proxy, Jupyter Notebook, or even the Kebnekaise desktop. The parameters required for all apps include:
    
    - **Compute Project** - Dropdown menu where you can choose (one of) your compute projects to launch with. 
    - **Number of Hours** - Wall time. The maximum is 12 hours, but you should avoid using more than you need to conserve your allocation and minimize queuing time.
    - **Node type** - Choose from options described below the dropdown menu. If you pick "any GPU", leave "Number of Cores" empty.   
    - **Number of Cores** - Choose any number up to 28. Each core has 4GB of memory. This is only a valid field if you pick "any" or "Large memory" for the "Node type" selection. 
    - **Working directory** - Default is $HOME. You can either type a full path manually or click "Select Path" to open a file browser if you are unsure of the full path.
    - **"I would like to receive an email when my job starts"** - Check box if you agree.

    For some apps, like RStudio and Jupyter Notebook, you will also see an option to choose a **Runtime environment.** Choose from "System provided", "Project provided", or "User provided". If you or your project do not have a custom environment (with specific Python or R packages, for instance), then use "System provided".

    Once you enter your desired parameters, click **Launch**. If the parameters are all valid, the page will reload and looks something like this for as long as your job is in the queue (using RStudio as an example):
    
    <div align="center">
      <img src="open-ondemand-Rstudio-waiting.png" alt="Open OnDemand RStudio waiting" width="500"/>
    </div>

    When the job starts, the title bar of the box containing your job will turn from blue to green, the status message will change from "Queued" to "Running", and the number of nodes and cores with appear in the title bar. You can have more than one OnDemand job running or queued. Running jobs will look like these:

    <div align="center">
      <img src="open-ondemand-sessions.png" alt="Open OnDemand jobs ready" width="500"/>
    </div>

    For all apps, the equivalent of a start button will be a bright blue rectangle near the bottom of the job box, though the words on the button may vary. When you click this button, your app should launch in a new window.

    !!! important
    
        Closing the GUI window for your app before time runs out (e.g. the MATLAB GUI or the browser for Jupyter Notebook) does not stop your job or release the resources associated with it! If you want to stop your job and avoid spending any more of your resource budget on it, you must click the red "Delete" button near the top right of your interactive job listing. Otherwise, you can reopen any closed app as long as time remains in the job allocated for it.

