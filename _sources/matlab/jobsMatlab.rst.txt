MATLAB GUI and SLURM
====================

.. questions::

   - What is a batch job?
   - How to make a batch for MATLAB?
   
.. objectives:: 

   - Understand and use the Slurm scheduler
   - Start batch jobs from MATLAB Graphical User Interface (GUI)
   - Try example

.. admonition:: Compute allocations in this workshop 

   - Rackham: ``naiss2024-22-1202``
   - Kebnekaise: ``hpc2n2024-114``
   - Cosmos: ``lu2024-7-80``
 
.. admonition:: Storage space for this workshop 

   - Rackham: ``/proj/r-py-jl-m-rackham``
   - Kebnekaise: ``/proj/nobackup/r-py-jl-m`` 
   - Cosmos: your home directory should have plenty of space

.. warning::

   - Any longer, resource-intensive, or parallel jobs must be run through a **batch script**.
   - On the login-nodes MATLAB MUST be started with the option '-singleCompThread', preventing MATLAB from using more than one thread.

.. note:: 

   - MATLAB is well integrated with SLURM and because of that there are several options to run these jobs:
       - Writing a batch script as for any other software and submitting the job with the ``sbatch`` command from SLURM 
         (This could be useful if you want to run long jobs, and you don't need to modify the code in the meantime).
         You have seen this in the previous section.
       - Using the job scheduler (``batch`` command) in MATLAB graphical user interface (GUI) (This is the Recommended Use).
       - Starting a ``parpool`` in the MATLAB GUI with a predefined cluster (This allows for more interactivity).

   - In the following sections we will extend the last two options. 

MATLAB Desktop/graphical interface
----------------------------------

Jobs can be submitted to the SLURM queue directly from the the MATLAB GUI as an alternative
to the standard bash scripts that are used with the command ``sbatch my-script.sh``, for instance.

.. figure:: ../img/matlab-gui.png
   :width: 450
   :align: center

   MATLAB GUI

To submit a job from the GUI, you will need to create a handle for the cluster and then use this
handle to send the job and control the outputs: 

.. code-block:: matlab

    % Get a handle to the cluster
    c=parcluster('name-of-your-cluster')
    % Run the job on CPU
    j = c.batch(@myfunction, N_out_values, {input1, input2, ...}, 'pool', N_workers')
    % alternatively, j=batch(c, @myfunction, N_out_values, {input1, input2, ...}, 'pool', N_workers')
    % Wait till the job has finished. Use j.State if you just want to poll the
    % status and be able to do other things while waiting for the job to finish.
    j.wait
    % Fetch the result after the job has finished
    j.fetchOutputs{:}

Note that ``batch`` also accepts script names in place of function names, but these must be given in single quotes, with no ``@`` or ``.m``. This is useful if your script is a job farm.


Serial jobs 
'''''''''''

As an example consider the following serial function ``hostnm`` that is in a file called
``hostnm.m`` which gets the name of the host machine as an output: 

.. code-block:: matlab

    function hn = hostnm()
       hn = getenv('HOSTNAME');
    end

We can send a job to the queue which executes this function and retrieving/printing out 
the results as follows:

.. code-block:: matlab

    c=parcluster('name-of-your-cluster');
    j = c.batch(@hostnm,1,{},'pool',1);
    j.wait;
    t = j.fetchOutputs{:};
    fprintf('Name of host: %s \n', t);


Parallel jobs
'''''''''''''

Jobs can be parallelized in MATLAB using functionalities such as ``parfor``, ``spmd``, and ``parfeval``.  

``parfor``
~~~~~~~~~~

This function will assist you if you want to parallelize a *for loop*. Although it will be performant, it imposes some constraints on the loops:

#. The number of iterations must be well-defined,
#. There can be no control over the individual workers, and
#. There must be no data dependencies between the iterations.

In the following example the name of the host machine will be printed ``n`` number of times  and this number will be divided across the available number of workers:

.. code-block:: matlab

    parfor i=1:4
       disp(getenv("HOSTNAME"))
    end

``spmd``
~~~~~~~~

Single program multiple data (SPMD) is supported in MATLAB through the ``spmd`` functionality, here 
you enclose the code that will be executed by some workers independently. The workers are labeled with 
the variable ``labindex`` that can be used to control the workload of each worker. In the following
example the name of the host will be displayed as many times as the present number of workers: 

.. code-block:: matlab

    spmd
        A = labindex;              % label for each worker 
        disp(getenv("HOSTNAME"))   % display the name of the host
    end

``parfeval``
~~~~~~~~~~~~

This function is more advanced than the previous two and it allows you to do asynchronous calculations,
which means that those calculations can start when resources are available but the execution order is not needed.
The results can be fetched once the simulation finishes.  

.. code-block:: matlab

    f = parfeval(@myFunction,'nr. of outputs', 'list of input arguments'); 
    results = fetchOutputs(f);


Running parallel jobs
'''''''''''''''''''''

Parallel jobs which include functions like ``parfor``, ``spmd``, and ``parfeval`` can be handled in two ways 
in the MATLAB GUI either by using the ``batch`` command (we mentioned above for serial jobs) or by creating a ``parpool``. 



Using ``batch``
~~~~~~~~~~~~~~~

It is recommended that you enclose the parallel code into a function and place it into a MATLAB script. In 
the ``parfor`` example mentioned above, we can write a script called ``hostnm.m`` containing this code:

.. code-block:: matlab

    function hn_all = hostnm(n)
        hn_all = [];
        parfor i=1:n
           hn = (getenv('HOSTNAME'));
           hn_all = [hn_all,hn];          % This array stores the host names for each worker
        end
    end 

Then, in the MATLAB GUI I can execute this function and retrieve/print out the results as follows:

.. code-block:: matlab
   
    c=parcluster('name-of-your-cluster');
    j = c.batch(@hostnm,'nr. outputs',{'list of input args'},'pool','nr. workers');      
    j.wait;                               % wait for the results
    t = j.fetchOutputs{:};                % fetch the results
    fprintf('Name of host: %s \n', t);    % Print out the results

Notice that if you will use this sequence of commands to launch many jobs, it will be convenient to write 
a MATLAB script so that next time you have these commands at hand. 

Creating a ``parpool``
~~~~~~~~~~~~~~~~~~~~~~

If you are doing continuous modifications to your code and running it to make sure that it works, 
using a ``parpool`` could be a better option than the ``batch`` command. Here, you create a 
pool of workers with the ``parpool`` function that are available to run parallel functions such
as those mentioned above (``parfor``, ``spmd``, and ``parfeval``) until this pool is deleted. 

.. warning::
   
   Notice that if you run a serial function (that maybe consumes 100% of the CPU) inside a ``parpool``
   block, this function will be executed on the local machine (maybe the login node) and not on a 
   compute node.

In the following example a pool of ``n`` workers is created that will solve a ``parfor`` loop 
which will display the host name:

.. code-block:: matlab
   
    % Use parallel pool with 'parfor'
    parpool('name-of-your-cluster',n);  % Start parallel pool with nworkers = n workers

        parfor i=1:n
            disp(getenv("HOSTNAME"))
        end

    % Clean up the parallel pool
    delete(gcp('nocreate'));

Notice that the host name displayed is the one where the job ran not where the MATLAB GUI is running.
All parallel functionalities in MATLAB can be executed inside a ``parpool``. 

-------------------

Exercises
---------


.. challenge:: Create and run a parallel code
   :class: dropdown

   We have the following code in MATLAB that generates an array of 10000 random numbers and then the 
   sum of all elements is stored in a variable called **s**:

   .. code-block:: matlab 

       r = rand(1,10000);
       s = sum(r); 

   We want now to repeat these steps (generating the numbers and taking the sum) 6 times so that 
   the steps are run at the same time. Use ``parfor`` to parallelize these steps. Once your code is
   parallelized enclose it in a ``parpool`` section and send the job to the queue. 

.. solution:: Solution 

    .. code-block:: matlab 

        % Nr. of workers
        nworkers = 6;

        % Use parallel pool with 'parfor'
        parpool('name-of-your-cluster',nworkers);  % Start parallel pool with nworkers workers

        myarray = []; % Optional in this exercise to store partial results
        parfor i=1:nworkers
           r = rand(1,10000);
           s = sum(r);
           myarray = [myarray,s];
        end

        myarray  % print out the results from the workers

        % Clean up the parallel pool
        delete(gcp('nocreate')); 

.. challenge:: Run a parallel code with ``batch`` MATLAB function
   :class: dropdown

   The following function uses ``parfeval`` to do some computation (specifically it takes the 
   average per-column of a matrix with a size ``nsize`` equal to 1000):

   .. code-block:: matlab 

        function results = parfeval_mean(nsize)
            results = parfeval(@mean, 1, rand(nsize))
        end

   Place this function in a file called **parfeval_mean.m** and submit this function with 
   the MATLAB ``batch`` command.

.. solution:: Solution 

    .. code-block:: matlab 

        c=parcluster('name-of-your-cluster');
        j = c.batch(@parfeval_mean,1,{1000},'pool',1);      
        j.wait;                               % wait for the results
        t = j.fetchOutputs{:};                % fetch the results
        fprintf('Name of host: %.5f \n', t);    % Print out the results

.. keypoints::

   - The SLURM scheduler handles allocations to the calculation nodes
   - MATLAB has good integration with SLURM and because of that one can submit jobs to the
     queue directly from the GUI.  
   - MATLAB has several tools to parallelize your code and we have explored here ``parfor``, ``spmd``,
     and ``parfeval``, but there are other `tools available <https://se.mathworks.com/help/overview/parallel-computing.html?s_tid=hc_product_group_bc>`_. 
    
