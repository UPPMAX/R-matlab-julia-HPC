Summary
=======


.. keypoints::

   - Load and run
      - Use Julia from module system
      - Start a Julia shell session either with ``julia``
      - run scripts with ``julia <script.jl>``
   - Packages
      - Check for preinstalled packages
  
         - from the Julia REPL with the ``using`` or ``import`` command
     
   - Isolated environments 

      - With a virtual environment you can tailor an environment with specific versions 
        for Julia and packages, not interfering with other installed Julia versions and 
        packages.
      - Make it for each project you have for reproducibility.
      - Julia has its own mechanism to create virtual environments. 
  
         - HPC2N & LUNARC
  
            - The Julia installation is lean, no additional package besides the Base and
              and Standard Libraries are installed.
         
         - UPPMAX 
  
            - Several packages are already installed

   - Batch mode
      - The SLURM scheduler handles allocations to the calculation nodes
      - Batch jobs runs without interaction with user
      - A batch script consists of a part with *SLURM parameters* describing 
        the allocation and a second part describing the actual work within the job, 
        for instance one or several Julia scripts.
      - Remember to include possible input arguments to the Julia script in the batch script.
   
   - Interactive work on calculation nodes
      - Start an interactive session on a calculation node by a SLURM allocation 
        (similar flags)
      
         - At HPC2N: ``salloc`` ...
         - At UPPMAX/LUNARC: ``interactive`` ...

      - Follow the same procedure as usual by loading the Julia module and possible prerequisites.
      - Run Julia in Jupyter lab/notebook

         - Procedure is to use the IJulia package and start a jupyter notebook from the julia command line.

   - Parallel
      - You deploy cores and nodes via SLURM, either in interactive mode or batch
      - In Julia, threads, distributed and MPI parallelization can be used.

   - GPUs
      -  You deploy GPU nodes via SLURM, either in interactive mode or batch
      -  In Julia the CUDA package is handy




.. challenge:: Not really clear? (5 min)

    - Discuss in breakout rooms
    - Learn from each other

.. note:: Evaluation 

   You can find the evaluation form for the Julia part of the course here: https://forms.office.com/e/PzkkX3SvB1
    
.. seealso::


     - Documentation at the HPC centres UPPMAX and HPC2N
        - UPPMAX: https://docs.uppmax.uu.se/software/julia/
        - HPC2N: https://www.hpc2n.umu.se/resources/software/julia
     - Official Julia documentation is found here: https://docs.julialang.org/en/v1/
     - Slack channel for Julia and instructions for joining it are found here: https://julialang.org/slack/
     - HPC2N YouTube video on Julia in HPC: https://www.youtube.com/watch?v=bXHe7Kj3Xxg
     - Julia for High Performance Computing course material from ENCCS: https://enccs.github.io/julia-for-hpc/


.. note::
    
    - Julia language becomes increasingly popular.
    - We also have a web pages for Julia: 
  
       - UPPMAX https://docs.uppmax.uu.se/software/julia/
       - HPC2N https://www.hpc2n.umu.se/resources/software/julia
    
    
