#!/usr/bin/env julia

using Base.Threads
using Printf
using Dates


# --- Helper for argument parsing ---
function parse_args()
    args = ARGS
    if length(args) == 0 || length(args) > 2
        println("""
        ERROR: Incorrect number of arguments.

        Please specify:

        - the number of workers this calculation uses
        - (optionally) a grid size

        General usage:

          julia integration2d.jl [n_workers] [grid_size]

        Examples:

          julia integration2d.jl 1
          julia integration2d.jl 1 16384
        """)
        exit(1)
    end
    n_workers = parse(Int, args[1])
    grid_size = length(args) == 2 ? parse(Int, args[2]) : 16384
    return n_workers, grid_size
end

# --- HPC cluster detection ---
function extract_hpc_cluster(hostname::String = get(ENV, "HOSTNAME", ""))
    if length(hostname) == 0
        return "unknown"
    elseif occursin(r"^b-cn\d{1,6}$", hostname)
        return "kebnekaise"
    elseif occursin(r"^cn\d{1,3}$", hostname)
        return "cosmos"
    elseif occursin(r"^cosmos\d*\.int\.lunarc$", hostname)
        return "cosmos"
    elseif occursin(r"^login\d$", hostname)
        return "dardel"
    elseif occursin(r"^n\d{1,6}$", hostname)
        return "tetralith"
    elseif occursin(r"^nid\d{1,6}$", hostname)
        return "dardel"
    elseif occursin(r"^pelle\d*\.uppmax\.uu\.se$", hostname)
        return "pelle"
    elseif occursin(r"^p\d{1,3}$", hostname)
        return "pelle"
    elseif occursin(r"^rackham\d*\.uppmax\.uu\.se$", hostname)
        return "rackham"
    elseif occursin(r"^r\d{1,4}$", hostname)
        return "rackham"
    else
        return hostname
    end
end

# --- 2D integration function ---
function integration2d(grid_size::Int, n_workers::Int, worker_index::Int)
    @assert grid_size > 0
    @assert n_workers > 0
    @assert worker_index > 0
    @assert worker_index <= n_workers

    h = π / grid_size
    mysum = 0.0
    workload = fld(grid_size, n_workers)
    begin_index = workload * (worker_index - 1) + 1
    end_index = workload * worker_index

    for i in begin_index:end_index
        x = h * (i - 0.5)
        for j in 1:grid_size
            y = h * (j - 0.5)
            mysum += sin(x + y)
        end
    end
    return h^2 * mysum
end

# --- Main program ---
function main()
    n_workers, grid_size = parse_args()
    n_threads = Threads.nthreads()
    println("Number of workers: $n_workers")
    println("Number of threads: $(n_threads)")
    @assert n_workers == n_threads
    @assert n_workers > 0 && n_workers < 256*256
    println("Grid size: $grid_size")

    # Distribute integration2d to all workers
    function integration2d(grid_size::Int, n_workers::Int, worker_index::Int)
        h = pi / grid_size
        mysum = 0.0
        workload = fld(grid_size, n_workers)
        begin_index = workload * (worker_index - 1) + 1
        end_index = workload * worker_index
        for i in begin_index:end_index
            x = h * (i - 0.5)
            for j in 1:grid_size
                y = h * (j - 0.5)
                mysum += sin(x + y)
            end
        end
        return h^2 * mysum
    end

    # Start timing
    starttime = now()

    # Use ones to detect an error
    results = ones(n_workers)

    Threads.@threads for worker_index = 1:n_workers
       results[worker_index] = integration2d(grid_size, n_workers, worker_index)
    end

    integral_value = sum(results)
    endtime = now()

    # Print human-friendly results
    error_value = abs(integral_value - 0.0)
    duration_secs = convert(Float64, (endtime - starttime).value) / 1000.0
    core_secs = duration_secs * n_workers
    println("Integral value: $integral_value")
    println("Integral error: $error_value")
    println("Time spent on 1 core (seconds): $duration_secs")
    println("Time spent on all cores (seconds): $core_secs")

    # Print computer-friendly results
    language = "julia"
    hpc_cluster = extract_hpc_cluster()
    println("language,hpc_cluster,grid_size,n_workers,core_secs")
    println("$(language),$(hpc_cluster),$(grid_size),$(n_workers),$(core_secs)")
end

main()
