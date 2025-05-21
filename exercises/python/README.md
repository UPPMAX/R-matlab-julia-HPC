# All/most of the Python .py and batch scripts for the Python session

Batch scripts can be recognized from the ending .sh

In many cases there are batch scripts for both Kebnekaise and Rackham (or Snowy). In some cases there are
also separate .py files for the clusters.

The batch scripts that do not have "kebnekaise-", "-rackham", or "-snowy" in their name should have a description
inside that tells what they are for.

You could try creating a batch job for Rackham if only one for Kebnekaise exist! Or try running different Python codes.


## add.py example

- ``add2.py``  :  python code, example for running interactively or from command line

## example.py example

- ``example.py``  : python code, adds two numbers given in the file. For interactive/command line testing

## TensorFlow example

- ``my_tf_program.py``  : python code, TensorFlow example. Used in ``gpu-python-kebnekaise.sh``
- ``gpu-python-kebnekaise.sh``  : batch script for the above python code

## add-list.py example

- ``add-list.py``  : python code, uses numba to add two vectors
- ``add-list-kebnekaise.sh``  : Kebnekaise batch script to run the above ``add-list.py``
- ``add-list-snowy.sh``  : Snowy batch script to run the above ``add-list.py``

## PyTorch example

- ``pytorch_fitting_gpu.py``  : python code, fitting ``y=sin(x)`` with a third order polynomial using PyTorch
- ``pytorch_fitting_gpu-kebnekaise.sh``
- ``pytorch_fitting_gpu-snowy.sh``

## mmult.py example

- ``mmmult.py``  : python code, does matrix-matrix multiplication using numpy
- ``mmmult-kebnekaise.sh``
- ``mmmult-rackham.sh``

## numba example

- ``integration2d_gpu.py``  : python code, 2D integration problem with the CUDA support for Numba
- ``integration2d_gpu_shared.py``
- ``integration2d_gpu.sh``

## multiproc.py example

- ``multiproc.py``
- ``multiproc-kebnekaise.sh``
- ``multiproc-rackham.sh``

## sum-2args.py example

- ``sum-2args.py``  : python code, sums to numbers given as arguments
- ``sum-2args-kebnekaise.sh``
- ``sum-2args-rackham.sh``

## Virtual environment in a batch job example

- ``seaborn-code-kebnekaise.py``
- ``serial-python-virt-kebnekaise.sh``
- ``seaborn-code-rackham.py``
- ``serial-python-virt-rackham.sh``

## scikit example

- ``scikit-learn-kebnekaise.py``  : python code example for Kebnekaise, using scikit-learn
- ``scikit-learn-kebnekaise.sh``

## some example batch scripts

- ``sequential-python.sh``

- ``serial-python-scipybundle-kebnekaise.sh``

