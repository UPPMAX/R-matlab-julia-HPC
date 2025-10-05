# Distributed parallelism

!!! info "Learning outcomes"

    - I can schedule jobs with distributed parallelism
	- I know the basic difference between threads and distributed memory in terms of memory share
    - I can explain how jobs with distributed parallelism are scheduled
    - I can explain how Julia/MATLAB/R code makes use of distributed parallelism

???- info "For teachers"

    Teaching goals are:

    - .

    Prior:

    - Parallelism.

    Feedback:

    - .


![Arnold (at the left): a robot that was controlled by MPI](arnold.jpg)
![Cora, the robotic platform for Arnold](cora.jpg)

## Why distributed parallelism is important

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

Type of parallelism   |Number of cores|Number of nodes|Memory                      |Library
----------------------|---------------|---------------|----------------------------|-------
Single-threaded       |1              |1              |As given by operating system|None
Threaded/shared memory|Multiple       |1              |Shared by all cores         |OpenMP
Distributed           |Multiple       |1 or Multiple  |Distributed                 |MPI (Example OpenMPI/MPICH)

<!-- markdownlint-enable MD013 -->

## Notes

- Distributed programming.
  Uses a Message Passing Interface.
  For a job that use many different nodes,
  for example, a weather prediction.

## Test the R script

```bash
mpirun Rscript do_2d_integration.R 1 1
```

## Output

=== "Using 1 MPI processes"

    ```text
    Using 2 OpenMP threads 

                   Core t (s)   Wall t (s)        (%)
           Time:       86.902       43.452      200.0
                     (ns/day)    (hour/ns)
    Performance:        1.740       13.794
    ```

=== "Using 2 MPI processes"

    ```text
                   Core t (s)   Wall t (s)        (%)
           Time:      100.447       50.224      200.0
                     (ns/day)    (hour/ns)
    Performance:        1.591       15.082
    ```

=== "Using 4 MPI processes"

    ```text
                   Core t (s)   Wall t (s)        (%)
           Time:      150.753       37.689      400.0
                     (ns/day)    (hour/ns)
    Performance:        3.783        6.345
    ```


=== "Using 8 MPI processes"

    ```text
                   Core t (s)   Wall t (s)        (%)
           Time:      292.200       36.526      800.0
                     (ns/day)    (hour/ns)
    Performance:        6.446        3.723
    ```

## Remember

- Use `--ntasks=N`
- Use `srun`
- Use an MPI version of your software:
  a 'regular' non-MPI version will never work!

## Links

- [MPI parallelism: multi-task programs](https://scicomp.aalto.fi/triton/tut/parallel-mpi/)
- [Older explanation](https://youtu.be/GHbrpg75qbQ)
- [Newer explanation](https://youtu.be/c7pVEBhPohk)

=== "Julia"

    Julia stuff here

=== "MATLAB"

    MATLAB stuff here

=== "R"

    R stuff here



!!! warning

    - Check if the resources that you allocated are being used properly.
    - Monitor the usage of hardware resources with tools offered at your HPC center, for instance
     [job-usage at HPC2N](https://hpc2n.github.io/intro-course/software/#best__practices).
    - Here there are some examples (of many) of what you will need to pay attention when porting
     a parallel code from your laptop (or another HPC center) to our clusters:

    === "HPC2N"

        We have a tool to monitor the usage of resources called:
         [job-usage at HPC2N](https://hpc2n.github.io/intro-course/software/#best__practices).

    === "Other"

         If you are in a interactive node session the ``top`` command will give you information
         of the resources usage.



## Distributed programming

Although threaded programming is convenient because one can achieve considerable initial speedups
with little code modifications, this approach does not scale for more than hundreds of
cores. Scalability can be achieved with distributed programming. Here, there is not
a common shared memory but the individual `processes` (notice the different terminology
with `threads` in shared memory) have their own memory space. Then, if a process requires
data from or should transfer data to another process, it can do that by using `send` and
`receive` to transfer messages. A standard API for distributed computing is the Message
Passing Interface (MPI). In general, MPI requires refactoring of your code.

.. admonition:: Language-specific nuances for distributed programming
   :class: dropdown

   .. tabs::

      .. tab:: Julia

         The mechanism here is called `Julia processes` which  can be activated by executing a script as follows
         ``julia -p X script.jl``, where *X* is the number of processes. Code modifications are required to support the
         workers. Julia also supports MPI through the package ``MPI.jl``.

      .. tab:: R

         R doesn't have a multiprocessing mechanism as the other languages discussed in this course. Some
         functions provided by certain packages (parallel, doParallel, etc.), for instance, *foreach*,
         offer parallel features. The processes generated by these functions have their own workspace which
         could lead to `data replication <https://hpc2n.github.io/intro-course/software/#recommendations).
         MPI is supported in R through the ``Rmpi`` package.

      .. tab:: Matlab

         In Matlab one can use the ``parpool('my-cluster',X)`` where *X* is the number of workers.  The total number of processes spawned will always be *X+1* where the extra process handles the overhead for the rest. See the
         `documentation for parpool <https://se.mathworks.com/help/parallel-computing/parpool.html) from MatWorks.
         Matlab doesn't support MPI function calls in Matlab code, it could be used indirectly through
         `mex <https://se.mathworks.com/help/matlab/ref/mex.html) functions though.

## Big data


Sometimes the workflow you are targeting doesn't require extensive computations but mainly dealing with
big pieces of data. An example can be, reading a column-structured file and doing some transformation per-column.
Fortunately, all languages covered in this course have already several tools to deal with big data.
We list some of these tools in what follows but notice that other tools doing similar jobs can be
available for each language.

.. admonition:: Language-specific tools for big data
   :class: dropdown

   .. tabs::

      .. tab:: Julia

         **Dagger**

         According to the developers of this framework, `Dagger <https://juliaparallel.org/Dagger.jl/dev/)
         is heavily inspired on Dask. It support distributed arrays so that they could fit the memory and
         also the possibility of parallelizing the computations on these arrays.

      .. tab:: R

         `Arrow <https://arrow.apache.org/docs/r/index.html) (previously *disk.frame*) can deal with
         big arrays. Other tools include `data.table <https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html)
         and `bigmemory <https://cran.r-project.org/web/packages/bigmemory/index.html).

      .. tab:: Matlab

         In Matlab `Tall Arrays <https://se.mathworks.com/help/matlab/tall-arrays.html) and
         `Distributed Arrays <https://se.mathworks.com/help/parallel-computing/distributed-arrays.html)
         will assist you when dealing with large arrays.

-------------------

## Exercises


!!! example "Running a parallel code efficiently"

    In this exercise we will run a parallelized code that performs a 2D integration:

    ```math
    \int^{\pi}_{0}\int^{\pi}_{0}\sin(x+y)dxdy = 0
	```

    One way to perform the integration is by creating a grid in the ``x`` and ``y`` directions.
    More specifically, one divides the integration range in both directions into ``n`` bins.


    === "Julia"

        Here is a parallel code using the ``Distributed`` package in Julia (call it
        ``integration2d_distributed.jl``):

        !!! admonition "integration2d_distributed.jl"

            ```julia

               using Distributed
               using SharedArrays
               using LinearAlgebra
               using Printf
               using Dates

               # Add worker processes (replace with actual number of cores you want to use)
               nworkers = *FIXME*
               addprocs(nworkers)

               # Grid size
               n = 20000
               # Number of processes
               numprocesses = nworkers
               # Shared array to store partial sums for each process
               partial_integrals = SharedVector{Float64}(numprocesses)

               # Function for 2D integration using multiprocessing
               # the decorator @everywher instruct Julia to transfer this function to all workers
               @everywhere function integration2d_multiprocessing(n, numprocesses, processindex, partial_integrals)
                   # Interval size (same for X and Y)
                   h = π / n
                   # Cumulative variable
                   mysum = 0.0
                   # Workload for each process
                   workload = div(n, numprocesses)

                   # Define the range of work for each process according to index
                   begin_index = workload * (processindex - 1) + 1
                   end_index = workload * processindex

                   # Regular integration in the X axis
                   for i in begin_index:end_index
                       x = h * (i - 0.5)
                       # Regular integration in the Y axis
                       for j in 1:n
                           y = h * (j - 0.5)
                           mysum += sin(x + y)
                       end
                   end

                   # Store the result in the shared array
                   partial_integrals[processindex] = h^2 * mysum
               end

               # function for main
               function main()
                   # Start the timer
                   starttime = now()

                   # Distribute tasks to processes
                   @sync for i in 1:numprocesses
                       @spawnat i integration2d_multiprocessing(n, numprocesses, i, partial_integrals)
                   end

                   # Calculate the total integral by summing over partial integrals
                   integral = sum(partial_integrals)

                   # end timing
                   endtime = now()

                   # Output results
                   println("Integral value is $(integral), Error is $(abs(integral - 0.0))")
                   println("Time spent: $(Dates.value(endtime - starttime) / 1000) sec")
               end

               # Run the main function
               main()
               
            ```

        Run the code with the following batch script.

        !!! admonition "job.sh"
    
            === "UPPMAX"

                ```bash

                       #!/bin/bash -l
                       #SBATCH -A naiss202X-XY-XYZ  # your project_ID
                       #SBATCH -J job-serial        # name of the job
                       #SBATCH -n *FIXME*           # nr. tasks/coresw
                       #SBATCH --time=00:20:00      # requested time
                       #SBATCH --error=job.%J.err   # error file
                       #SBATCH --output=job.%J.out  # output file

                       ml julia/1.8.5

                       julia integration2d_distributed.jl
                ```

            === "HPC2N"

                ```bash

                       #!/bin/bash
                       #SBATCH -A hpc2n202x-xyz     # your project_ID
                       #SBATCH -J job-serial        # name of the job
                       #SBATCH -n *FIXME*           # nr. tasks
                       #SBATCH --time=00:20:00      # requested time
                       #SBATCH --error=job.%J.err   # error file
                       #SBATCH --output=job.%J.out  # output file

                       ml purge  > /dev/null 2>&1
                       ml Julia/1.9.3-linux-x86_64

                       julia integration2d_distributed.jl
                ```
                
            === "LUNARC"

                ```sh

                     #!/bin/bash
                     #SBATCH -A lu202X-XX-XX      # your project_ID
                     #SBATCH -J job-serial        # name of the job
                     #SBATCH -n *FIXME*           # nr. tasks
                     #SBATCH --time=00:20:00      # requested time
                     #SBATCH --error=job.%J.err   # error file
                     #SBATCH --output=job.%J.out  # output file
                     # reservation (optional)
                     #SBATCH --reservation=RPJM-course*FIXME*

                     ml purge  > /dev/null 2>&1
                     ml Julia/1.9.3-linux-x86_64

                     julia integration2d_distributed.jl
                ```
                
            === "PDC"

                ```bash

                     #!/bin/bash
                     #SBATCH -A naiss202t-uv-wxyz # your project_ID
                     #SBATCH -J job               # name of the job
                     #SBATCH  -p shared           # name of the queue
                     #SBATCH --ntasks=*FIXME*     # nr. of tasks
                     #SBATCH --cpus-per-task=1    # nr. of cores per-task
                     #SBATCH --time=00:03:00      # requested time
                     #SBATCH --error=job.%J.err   # error file
                     #SBATCH --output=job.%J.out  # output file

                     # Load dependencies and Julia version
                     ml PDC/23.12 julia/1.10.2-cpeGNU-23.12

                     julia integration2d_distributed.jl
                ```
                
            === "NSC"

                ```bash

                     #!/bin/bash
                     #SBATCH -A naiss202t-uv-xyz  # your project_ID
                     #SBATCH -J job-serial        # name of the job
                     #SBATCH -n *FIXME*           # nr. tasks
                     #SBATCH --time=00:20:00      # requested time
                     #SBATCH --error=job.%J.err   # error file
                     #SBATCH --output=job.%J.out  # output file

                     # Load any modules you need, here for Julia
                     ml julia/1.9.4-bdist

                     julia integration2d_distributed.jl
                 ```
                 
        Try different number of cores for this batch script (*FIXME* string) using the sequence:
        1,2,4,8,12, and 14. Note: this number should match the number of processes
        (also a *FIXME* string) in the Julia script. Collect the timings that are
        printed out in the **job.*.out**. According to these execution times what would be
        the number of cores that gives the optimal (fastest) simulation?

        Challenge: Increase the grid size (``n``) to 100000 and submit the batch job with 4 workers (in the
        Julia script) and request 5 cores in the batch script. Monitor the usage of resources
        with tools available at your center, for instance ``top`` (UPPMAX) or
        ``job-usage`` (HPC2N).

    === "R"

        Here is a parallel code using the ``parallel`` and ``doParallel`` packages in R (call it
          ``integration2d.R``). Note: check if those packages are already installed for the required
          R version, otherwise install them with ``install.packages()``. The recommended R version
          for this exercise is ``ml GCC/12.2.0 OpenMPI/4.1.4 R/4.2.2`` (HPC2N).

        !!! admonition "integration2d.R"

            ```R

                 library(parallel)
                 library(doParallel)

                 # nr. of workers/cores that will solve the tasks
                 nworkers <- *FIXME*

                 # grid size
                 n <- 840

                 # Function for 2D integration (non-optimal implementation)
                 integration2d <- function(n, numprocesses, processindex) {
                   # Interval size (same for X and Y)
                   h <- pi / n
                   # Cumulative variable
                   mysum <- 0.0
                   # Workload for each process
                   workload <- floor(n / numprocesses)

                   # Define the range of work for each process according to index
                   begin_index <- workload * (processindex - 1) + 1
                   end_index <- workload * processindex

                   # Regular integration in the X axis
                   for (i in begin_index:end_index) {
                     x <- h * (i - 0.5)
                     # Regular integration in the Y axis
                     for (j in 1:n) {
                       y <- h * (j - 0.5)
                       mysum <- mysum + sin(x + y)
                     }
                   }
                   # Return the result
                   return(h^2 * mysum)
                 }

                 # Set up the cluster for doParallel
                 cl <- makeCluster(nworkers)
                 registerDoParallel(cl)

                     # Start the timer
                     starttime <- Sys.time()

                     # Distribute tasks to processes and combine the outputs into the results list
                     results <- foreach(i = 1:nworkers, .combine = c) %dopar% { integration2d(n, nworkers, i) }

                     # Calculate the total integral by summing over partial integrals
                     integral <- sum(results)

                     # End the timing
                     endtime <- Sys.time()

                     # Print out the result
                     print(paste("Integral value is", integral, "Error is", abs(integral - 0.0)))
                     print(paste("Time spent:", difftime(endtime, starttime, units = "secs"), "seconds"))

                 # Stop the cluster after computation
                 stopCluster(cl)
            ```
            
        Run the code with the following batch script.

        !!! admonition "job.sh"

            === "UPPMAX"

                ```bash

                         #!/bin/bash -l
                         #SBATCH -A naiss202u-wv-xyz  # your project_ID
                         #SBATCH -J job-serial        # name of the job
                         #SBATCH -n *FIXME*           # nr. tasks/coresw
                         #SBATCH --time=00:20:00      # requested time
                         #SBATCH --error=job.%J.err   # error file
                         #SBATCH --output=job.%J.out  # output file

                         ml R_packages/4.1.1

                         Rscript --no-save --no-restore integration2d.R
                ```
                
            === "HPC2N"

                ```bash

                         #!/bin/bash
                         #SBATCH -A hpc2n202w-xyz     # your project_ID
                         #SBATCH -J job-serial        # name of the job
                         #SBATCH -n *FIXME*           # nr. tasks
                         #SBATCH --time=00:20:00      # requested time
                         #SBATCH --error=job.%J.err   # error file
                         #SBATCH --output=job.%J.out  # output file

                         ml purge > /dev/null 2>&1
                         ml GCC/12.2.0  OpenMPI/4.1.4 R/4.2.2
                         Rscript --no-save --no-restore integration2d.R
                ```
                
            === "LUNARC

                 ```sh

                      #!/bin/bash
                      #SBATCH -A lu202u-wy-yz      # your project_ID
                      #SBATCH -J job-serial        # name of the job
                      #SBATCH -n *FIXME*           # nr. tasks
                      #SBATCH --time=00:20:00      # requested time
                      #SBATCH --error=job.%J.err   # error file
                      #SBATCH --output=job.%J.out  # output file
                      #SBATCH --reservation=RPJM-course*FIXME* # reservation (optional)

                      ml purge > /dev/null 2>&1
                      ml GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1
                      Rscript --no-save --no-restore integration2d.R
                ```
                
            === "PDC

               ```bash

                     #!/bin/bash
                     #SBATCH -A naiss202t-uv-wxyz # your project_ID
                     #SBATCH -J job               # name of the job
                     #SBATCH  -p shared           # name of the queue
                     #SBATCH --ntasks=*FIXME*     # nr. of tasks
                     #SBATCH --cpus-per-task=1    # nr. of cores per-task
                     #SBATCH --time=00:03:00      # requested time
                     #SBATCH --error=job.%J.err   # error file
                     #SBATCH --output=job.%J.out  # output file

                     # Load dependencies and R version
                     ml ...

                     Rscript --no-save --no-restore integration2d.R
                ```
                
            === "NSC

               ```bash

                     #!/bin/bash
                     #SBATCH -A naiss202t-uv-xyz  # your project_ID
                     #SBATCH -J job-serial        # name of the job
                     #SBATCH -n *FIXME*           # nr. tasks
                     #SBATCH --time=00:20:00      # requested time
                     #SBATCH --error=job.%J.err   # error file
                     #SBATCH --output=job.%J.out  # output file

                     # Load any modules you need, here for R
                     ml R/4.4.0-hpc1-gcc-11.3.0-bare

                     Rscript --no-save --no-restore integration2d.R
                
                ```
                
        Try different number of cores for this batch script (*FIXME* string) using the sequence:
        1,2,4,8,12, and 14. Note: this number should match the number of processes
        (also a *FIXME* string) in the R script. Collect the timings that are
        printed out in the **job.*.out**. According to these execution times what would be
        the number of cores that gives the optimal (fastest) simulation?

        Challenge: Increase the grid size (``n``) to 10000 and submit the batch job with 4 workers (in the
        R script) and request 5 cores in the batch script. Monitor the usage of resources
        with tools available at your center, for instance ``top`` (UPPMAX) or
        ``job-usage`` (HPC2N).

    === "Matlab"

        Here is a parallel code using the ``parfor`` tool from Matlab (call it
          ``integration2d.m``).

        ???- admonition "integration2d.m"
 
            ```matlab

            % Number of workers/processes
            num_workers = *FIXME*;

            % Use parallel pool with 'parfor'
            parpool('profile-name',num_workers);  % Start parallel pool with num_workers workers

            % Grid size
            n = 6720;

            % bin size
            h = pi / n;

            tic;  % Start timer
            % Shared variable to collect partial sums
            partial_integrals = 0.0;

            % In Matlab one can use parfor to parallelize loops
            parfor i = 1:n
                partial_integrals = partial_integrals + integration2d_partial(n,i);
            end

            % Compute the integrals by multilpying by the bin size
            integral = partial_integrals * h^2;
            elapsedTime = toc;  % Stop timer

            fprintf("Integral value is %e\n", integral);
            fprintf("Error is %e\n", abs(integral - 0.0));
            fprintf("Time spent: %.2f sec\n", elapsedTime);

            % Clean up the parallel pool
            delete(gcp('nocreate'));

            % Function for the 2D integration only computes a single bin
            function mysum = integration2d_partial(n,i)
                % bin size
                h = pi / n;
                % Partial summation
                mysum = 0.0;
                    % A single bin is computed
                    x = h * (i - 0.5);
                    % Regular integration in the Y axis
                    for j = 1:n
                        y = h * (j - 0.5);
                        mysum = mysum + sin(x + y);
                    end
            end
            ```
        
        You can run directly this script from the Matlab GUI.
        Try different number of cores for this batch script (*FIXME* string) using the sequence:
        1,2,4,8,12, and 14. Collect the timings that are printed out in the Matlab command window.
        According to these execution times what would be
        the number of cores that gives the optimal (fastest) simulation?

        Challenge: Increase the grid size (``n``) to 100000 and submit the batch job with 4 workers.
        Monitor the usage of resources with tools available at your center, for instance ``top`` (UPPMAX),
        ``job-usage`` (HPC2N), or if you're working in the GUI (e.g. on LUNARC), you can click ``Parallel``
        and then ``Monitor Jobs``. For ``job-usage``, you can see the job ID if you type ``squeue --me`` on a terminal on Kebnekaise.




!!! info "More info"

   - [HPC2N Julia documentation](https://www.hpc2n.umu.se/resources/software/julia).
   - [White paper on Julia parallel computing](https://juliahub.com/assets/pdf/Parallel-Computing-Guide-for-Julia-byJuliaHub.pdf).
   - [HPC2N R documentation](https://www.hpc2n.umu.se/resources/software/r).
   - [Wikipedias' article on Parallel Computing](https://en.wikipedia.org/wiki/Parallel_computing).
