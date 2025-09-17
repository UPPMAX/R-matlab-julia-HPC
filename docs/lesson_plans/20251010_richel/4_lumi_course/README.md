# LUMI course

Get the data:

```bash
wget https://a3s.fi/gmx-lumi/aqp-240122.tar.gz
tar -xf aqp-240122.tar.gz
cp aquaporin/topol.tpr .
```

Running:

```bash
gmx_mpi mdrun -g ex1.1 -nsteps -1 -maxh 0.017 -resethway -notunepme
```

Results in:


```
gmx_mpi mdrun \
-g ex1.1 \
-nsteps -1 -maxh 0.017 -resethway -notunepme
           :-) GROMACS - gmx mdrun, 2023.3-Ubuntu_2023.3_1ubuntu3 (-:

Executable:   /usr/bin/gmx_mpi
Data prefix:  /usr
Working dir:  /home/richel/GitHubs/R-matlab-julia-HPC/docs-mk/lesson_plans/20251010_richel/lumi_course
Command line:
  gmx_mpi mdrun -g ex1.1 -nsteps -1 -maxh 0.017 -resethway -notunepme

Compiled SIMD is SSE4.1, but AVX2_256 might be faster (see log).
Reading file topol.tpr, VERSION 2023.3-dev-20230922-fca514265a (single precision)
Overriding nsteps with value passed on the command line: -1 steps
Changing nstlist from 40 to 100, rlist from 1.2 to 1.287


Using 1 MPI process
Using 16 OpenMP threads 

starting mdrun 'prot and bilayer membed'
-1 steps, infinite ps.

step 1011: resetting all time and cycle counters

Step 2000: Run time exceeded 0.017 hours, will terminate the run within 100 steps

               Core t (s)   Wall t (s)        (%)
       Time:      613.429       38.340     1600.0
                 (ns/day)    (hour/ns)
Performance:        6.141        3.908

GROMACS reminds you: "FORTRAN, the infantile disorder, by now nearly 20 years old, is hopelessly inadequate for whatever computer application you have in mind today: it is now too clumsy, too risky, and too expensive to use." (Edsger Dijkstra, 1970)
```

Blimey, the log file knows things about my computer:


```
Running on 1 node with total 12 cores, 16 processing units
Hardware detected on host richel-latitude-7430 (the node of MPI rank 0):
  CPU info:
    Vendor: Intel
    Brand:  12th Gen Intel(R) Core(TM) i5-1250P
    Family: 6   Model: 154   Stepping: 3
    Features: aes apic avx avx2 clfsh cmov cx8 cx16 f16c fma htt intel lahf mmx msr nonstop_tsc pcid pclmuldq pdcm pdpe1gb popcnt pse rdrnd rdtscp sha sse2 sse3 sse4.1 sse4.2 ssse3 tdt x2apic
  Hardware topology: Full, with devices
    Packages, cores, and logical processors:
    [indices refer to OS logical processors]
      Package  0: [   0   1] [   2   3] [   4   5] [   6   7] [   8] [   9] [  10] [  11] [  12] [  13] [  14] [  15]
    CPU limit set by OS: -1   Recommended max number of threads: 16
    Numa nodes:
      Node  0 (16172212224 bytes mem):   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15
      Latency:
               0
         0  1.00
    Caches:
      L1: 49152 bytes, linesize 64 bytes, assoc. 12, shared 2 ways
      L2: 1310720 bytes, linesize 64 bytes, assoc. 10, shared 2 ways
      L3: 12582912 bytes, linesize 64 bytes, assoc. 8, shared 16 ways
    PCI devices:
      0000:00:02.0  Id: 8086:46a6  Class: 0x0300  Numa: 0
      0000:01:00.0  Id: 1c5c:1959  Class: 0x0108  Numa: 0
      0000:00:14.3  Id: 8086:51f0  Class: 0x0280  Numa: 0

Likely fastest SIMD instructions supported by all nodes: AVX2_256
SIMD instructions selected at compile time:              SSE4.1
```


Running on Pelle:

Single core, 85 seconds:

```bash
#SBATCH -A staff
#SBATCH --time=00:10:00 # maximum execution time of
#SBATCH --ntasks-per-node=1 # 1 MPI rank
#SBATCH --cpus-per-task=1 # number cpus-per-task
```

with log:

```
$ head -n 100 ex1.1_1x_jID42696.log 
              :-) GROMACS - gmx mdrun, 2024.4-EasyBuild_5.1.0 (-:

                  Coordinated by the GROMACS project leaders:
                           Berk Hess and Erik Lindahl

GROMACS:      gmx mdrun, version 2024.4-EasyBuild_5.1.0
Executable:   /sw/arch/eb/software/GROMACS/2024.4-foss-2023b/bin/gmx_mpi
Data prefix:  /sw/arch/eb/software/GROMACS/2024.4-foss-2023b
Working dir:  /domus/h1/richel
Process ID:   193730
Command line:
  gmx_mpi mdrun -g ex1.1_1x_jID42696 -nsteps -1 -maxh 0.017 -resethway -notunepme

GROMACS version:     2024.4-EasyBuild_5.1.0
Precision:           mixed
Memory model:        64 bit
MPI library:         MPI
MPI library version: Open MPI v4.1.6, package: Open MPI iusan@p204.uppmax.uu.se Distribution, ident: 4.1.6, repo rev: v4.1.6, Sep 30, 2023
OpenMP support:      enabled (GMX_OPENMP_MAX_THREADS = 128)
GPU support:         disabled
SIMD instructions:   AVX_512
CPU FFT library:     fftw-3.3.10-sse2-avx-avx2-avx2_128
GPU FFT library:     none
Multi-GPU FFT:       none
RDTSCP usage:        enabled
TNG support:         enabled
Hwloc support:       disabled
Tracing support:     disabled
C compiler:          /sw/arch/eb/software/OpenMPI/4.1.6-GCC-13.2.0/bin/mpicc GNU 13.2.0
C compiler flags:    -fexcess-precision=fast -funroll-all-loops -march=skylake-avx512 -Wno-missing-field-initializers -O3 -DNDEBUG
C++ compiler:        /sw/arch/eb/software/OpenMPI/4.1.6-GCC-13.2.0/bin/mpicxx GNU 13.2.0
C++ compiler flags:  -fexcess-precision=fast -funroll-all-loops -march=skylake-avx512 -Wno-missing-field-initializers -Wno-cast-function-type-strict SHELL:-fopenmp -O3 -DNDEBUG
BLAS library:        External - user-supplied
LAPACK library:      External - user-supplied

Running on 1 node with total 1 cores, 2 processing units
Hardware detected on host p62.uppmax.uu.se (the node of MPI rank 0):
  CPU info:
    Vendor: AMD
    Brand:  AMD EPYC 9454P 48-Core Processor               
    Family: 25   Model: 17   Stepping: 1
    Features: aes amd apic avx avx2 avx512f avx512cd avx512bw avx512vl avx512bf16 avx512secondFMA clfsh cmov cx8 cx16 f16c fma htt lahf misalignsse mmx msr nonstop_tsc pcid pclmuldq pdpe1gb popcnt pse rdrnd rdtscp sha sse2 sse3 sse4a sse4.1 sse4.2 ssse3 x2apic
  Hardware topology: Basic
    Packages, cores, and logical processors:
    [indices refer to OS logical processors]
      Package  0: [  32  80]
    CPU limit set by OS: -1   Recommended max number of threads: 2
```

