Desktop On Demand
=================


.. questions::

   - What is Desktop On Demand?
   - When should I useit?
   - Where and how do I start?

   
   
.. objectives:: 

   - Short introduction to Desktop On Demand
   - Typical setup and usage

    

What is Desktop On Demand?
--------------------------
At LUNARC (and coming to other HPC centers in the not-too-distant future), the Desktop On Demand service provides an interactive environment for submitting programs to SLURM without the typical shell script. It uses the graphical application launcher (GfxLauncher) to submit jobs to SLURM, connect to the application running on the Compute node, and monitor the application's progress. It is not itself an option in the Applications menu; rather, it's the engine that lets you run the listed applications interactively.

Later you will hear us talking more about the GfxLauncher than Desktop On Demand because while the latter is the underlying service provider, the former is what you will see every time you start an interactive application.

Of the coding languages in the course, all but Julia has at least one interactive development environment (IDE) that can be run with Desktop On Demand: Both Spyder and Jupyter notebooks are available for Python users, R can be used via one of a couple releases of RStudio, and the standard MATLAB IDE is available for the 3 most recent releases. Other applications not explicitly listed but that can be launched from an Interactive Terminal or Accelerated Terminal session.

Desktop On Demand requires the use of the Thinlinc interface. It is not accessible via ssh. 


When should I use it?
---------------------
Desktop On Demand is most appropriate for *interactive* work requiring small-to-medium amounts of computing resources.

The GfxLauncher will prompt you for resource specification and then Desktop On Demand will put your resource requests into the same SLURM queue as every other job. Depending on the time and resources you request, you may have to wait a while for your session to start. For information about the capabilities of the available nodes, you can explore the `LUNARC homepage's Systems tab <https://www.lunarc.lu.se/systems/>`_ and follow the links to your desired resource. (Note: COSMOS-SENS is past the installation phase and is available as a resource; hopefully I can delete this comment before the workshop.)

.. admonition:: **Wall Time Limits**
   
      Wall time for interactive work with Desktop On Demand is restricted to 48 consecutive
      not business) hours. In practice, there can be significant startup delays for wall times
      as short as 4 hours. Users should save their work frequently and be conservative in their
      wall time estimates. To save GPU resources, we also encourage users who are able to submit 
      jobs requiring minimal supervision as ordinary batch scripts to do that whenever feasible.


Some On Demand applications will let you configure and submit separate batch jobs that are not bound by the parameters set for the graphical user interface (GUI) in GfxLauncher, although the initial configuration process can be rather involved. For example, you could launch the MATLAB GUI with a wall time of 2 hours, but having set the right configurations, you could use a livescript in the GUI to submit a batch job that lasts 3 days. Such a batch job will not be interrupted if the GUI used to submit it closes or times out. Keep in mind that the optimal resources for the computations to be done in your batch job are often very different from the resources needed to run the GUI.

Getting Started
---------------

Where are the On-Demand Applications?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

On the LUNARC HPC Desktop, the Applications menu lists all the applications available to be run interactively, and opening one prefixed by "Applications -" will start it in Desktop On Demand. There is no specific "Desktop On Demand" application in the list. Most common IDEs can be found in a drop-down menu that appears when you hover over ``Applications - <Language>`` for your language of choice, but more niche packages may be listed under a subject-matter field instead, like ``Applications - Engineering``.

.. admonition:: Terminals on the Compute nodes

   If you don't see the program you want to run interactively listed under any other ``Applications`` sub-menus, you may still be able to launch it via one of the terminals under ``Applications - General``, or the **GPU Accelerated Terminal** (GPU support) under ``Applications - Visualization``.  
   
   
   .. figure:: ../../img/Cosmos-AppMenu.png
      :width: 400
      :align: center
   
   The CPU terminal allows for a wall time of up to 168 hours (7 days), while the two GPU terminals can only run for 48 hours (2 days) at most. For more on the specifications of the different nodes these terminals can run on, see `LUNARC's webpage on COSMOS <https://www.lunarc.lu.se/systems/cosmos/>`_.


**Please be aware that only the applications in the menus prefixed with "Applications -" are set up to run on the Compute nodes.** If you start a terminal session or other application from ``Favorites`` or ``System Tools`` and launch an interactive program from that, it will run on a Login node, with all the risks that that entails for your user privileges.


How do I start?
^^^^^^^^^^^^^^^

For most programs, the start-up process is roughly the same:

#. Log into COSMOS via Thinlinc to start a LUNARC HPC Desktop session.
#. Click ``Applications`` in the top left corner and hover over the items prefixed with ``Applications -`` until you find your desired application.
#. Upon clicking your chosen application, a pop-up, the Gfx Launcher interface, will appear and let you set the following options:
      #. **Wall time** - how long your interactive session will remain open. When it ends, the whole window closes immediately and any unsaved work is lost. You can select the time from a drop-down menu, or type in the time manually. CPU-only applications can run for up to 168 hours (7 days), but the rest are limited to 48 hours. Default is 30 minutes.
      #. **Requirements** - how many tasks per node you need. The default is usually 1 or 4 tasks per node. There is also a **gear icon** to the right of this box that can pull up a second menu where you can set the name of your job, the number of tasks per node, the amount of memory per CPU core, and/or toggle whether or not to use a full node.
      #. **Resource** - which kind of node you want in terms of the architecture (AMD or Intel) and number of cores in the CPU (or GPU). Options and defaults vary by program.
      #. **Project** - choose from a drop-down menu the project with which your work is associated. This is mainly to keep your usage in line with your licenses and permissions, and to send any applicable invoices to the correct PI. Licensed software will only work for projects whose group members are covered by the license.


      .. figure:: ../../img/Cosmos-OnDemand-Matlab23b-advreqs.png
         :width: 550
         :align: center

         The GfxLauncher GUI (here used to launch MATLAB). The box on the left is the basic menu and the box on the right is what pops up when the gear icon next to ``Requirements`` is clicked.

4. When you're happy with your settings, click "Start". The Gfx Launcher menu will stay open in the background so that you can monitor your remaining time and resources with the ``Usage`` bar.

If you want, you can also look at the associated SLURM scripts by clicking the "More" button at the bottom of the Gfx Launcher menu and clicking the "Script" tab (example below), or view the logs under the "Logg" tab.

.. figure:: ../../img/Cosmos-OnDemand-Matlab23b-more-script.png
   :width: 550
   :align: center
