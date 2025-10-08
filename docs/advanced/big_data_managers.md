# Big data and cluster managers

!!! info "Learning outcomes"

    - I understand how I can work with big data
    - I know where to find more information about big data
    - I understand how cluster managers work
    - I know where to find more information about cluster managers

## Big data

Sometimes the workflow you are targeting doesn't require extensive computations but mainly dealing with
big pieces of data. An example can be, reading a column-structured file and doing some transformation per-column.
Fortunately, all languages covered in this course have already several tools to deal with big data.
We list some of these tools in what follows but notice that other tools doing similar jobs can be
available for each language.

!!! admonition "Language-specific tools for big data"

    === "R"

        [Arrow](https://arrow.apache.org/docs/r/index.html) (previously *disk.frame*) can deal with
         big arrays. Other tools include [data.table](https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html)
         and [bigmemory](https://cran.r-project.org/web/packages/bigmemory/index.html).

    === "Matlab"

        In Matlab [Tall Arrays](https://se.mathworks.com/help/matlab/tall-arrays.html) and
         [Distributed Arrays](https://se.mathworks.com/help/parallel-computing/distributed-arrays.html)
         will assist you when dealing with large arrays.

    === "Julia"

        According to the developers of this framework, [Dagger](https://juliaparallel.org/Dagger.jl/dev/)
         is heavily inspired on Dask. It support distributed arrays so that they could fit the memory and
         also the possibility of parallelizing the computations on these arrays.

### Allocating memory (RAM)

- Storing the data in an efficient way is one thing!

- Using the data in a program is another. 
- How much is actually loaded into the working memory (RAM)
- Is more data in variables created during the run or work?

!!! important

    - Allocate many cores or a full node!
    - You do not have to explicitely run threads or other parallelism.
    - Note that shared memory among the cores works within node only.

!!! discussion

    - Take some time to find out the answers on the questions below, using the table of hardware
    - I'll ask around in a few minutes

??? note "Table of hardware"

   
    .. list-table:: Hardware
      :widths: 25 25 25 25 25 25 25 25
      :header-rows: 1

      * - Technology
        - Kebnekaise
        - Rackham
        - Snowy
        - Bianca
        - Cosmos  
        - Tetralith   
        - Dardel
      * - Cores/compute node
        - 28 (72 for largemem, 128/256 for AMD Zen3/Zen4)
        - 20
        - 16
        - 16
        - 48  
        - 32  
        - 128
      * - Memory/compute node
        - 128-3072 GB 
        - 128-1024 GB
        - 128-4096 GB
        - 128-512 GB
        - 256-512 GB  
        - 96-384 GB   
        - 256-2048 GB
      * - GPU
        - NVidia V100, A100, A6000, L40s, H100, A40, AMD MI100 
        - None
        - NVidia T4 
        - NVidia A100
        - NVidia A100 
        - NVidia T4   
        - 4 AMD Instinct™ MI250X á 2 GCDs

??? example "How much memory do I get per core?"

    - Divide GB RAM of the booked node with number of cores.
    - Example: 128 GB node with 20 cores
        - ~6.4 GB per core

??? example "How much memory do I get with 5 cores?"

    - Multiply the RAM per core with number of allocated cores..
    - Example: 6.4 GB per core 
        - ~32 GB 

??? example "Do you remember how to allocate several cores?"

    - Slurm flag ``-n <number of cores>``

!!! tip

    - Choose, if necessary a node with more RAM
    - See local HPC center documentation in how to do so!

## Cluster Managers

### Julia

The package *ClusterManagers.jl* allows you to submit expensive parts of your simulation
to the batch queue in a more *interactive* manner than by using batch scripts. *ClusterManagers.jl*
needs to be installed through **Pkg**. This can useful, for instance if you are developing some
code where just specific parts are computationally heavy while the rest is related to data analysis
or visualization. In order to use this package, you should add it in a Julia session.

```julia
using Distributed, ClusterManagers
# Adapted from: https://github.com/JuliaParallel/ClusterManagers.jl
# Arguments to the Slurm srun(1) command can be given as keyword
# arguments to addprocs.  The argument name and value is translated to
# a srun(1) command line argument as follows:
# 1) If the length of the argument is 1 => "-arg value",
#    e.g. t="0:1:0" => "-t 0:1:0"
# 2) If the length of the argument is > 1 => "--arg=value"
#    e.g. time="0:1:0" => "--time=0:1:0"
# 3) If the value is the empty string, it becomes a flag value,
#    e.g. exclusive="" => "--exclusive"
# 4) If the argument contains "_", they are replaced with "-",
#    e.g. mem_per_cpu=100 => "--mem-per-cpu=100"
# Example: add 2 processes, with your project ID, allocated 5 min, and 2 cores
addprocs(SlurmManager(2), A="project_ID", partition="name-of-partition", t="00:05:00", c="2")

# Define a function that computes the square of a number
@everywhere function square(x)
    return x^2
end

hosts = []
result = []
for i in workers()
        println(i)
    host = fetch(@spawnat i gethostname())
    push!(hosts, host)
    result_partial = fetch(@spawnat i square(i))
    push!(result, result_partial)
end

println(hosts)
println(result)

# The Slurm resource allocation is released when all the workers have
# exited
for i in workers()
    rmprocs(i)
end
```

