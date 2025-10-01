# All/most of the R .R and batch scripts for the R session

Batch scripts can be recognized from the ending .sh

In many cases there are batch scripts for both Kebnekaise, Pelle/Rackham (or Snowy), Cosmos, Tetralith, Dardel, and Alvis.

Any batch scripts that do not have a machine name (i.e. "kebnekaise-", "-rackham", "-snowy", etc. etc.) in their name should have a description inside that tells what they are for.

You could try creating a batch job for your centre if only one for one of the other centres exist! Or try running different R codes.

You can also try run the R codes directly, with Rscript (after loading R modules)

## add2.R example

- ``add2.R``  :  R code, adding two numbers given as arguments
- ``add2-kebnekaise.sh``  : batch script to run the above code on Kebnekaise
- ``add2-rackham.sh``  : batch script for running ``add2.R`` on Rackham

## iris_ml example

- ``iris_ml.R``  : R code, using ``caret``, taken from <https://machinelearningmastery.com/machine-learning-in-r-step-by-step/>
- ``iris.csv``  : dataset for the above file, in case the remote data-set cannot be accessed
- ``iris-ml-kebnekaise.sh``
- ``iris_ml-rackham.sh``

## parallel_foreach example

- ``parallel_foreach.R``  : R code
- ``parallel_foreach-kebnekaise.sh``  : batch script for the above R code, on Kebnekaise
- ``parallel_foreach-rackham.sh``  : batch script to run the above R code on Rackham

## Rmpi example

- ``Rmpi.R``  : R code, uses Rmpi
- ``Rmpi-kebnekaise.sh``  : Kebnekaise batch script to run the above ``Rmpi.R``
- ``Rmpi-rackham.sh``  : Snowy batch script to run the above ``Rmpi.R``

## ML GPU example

- ``Rscript.R``  : R code
- ``Rscript_ML-kebnekaise.sh``
- ``Rscript_ML-rackham.sh``

## Validation/ML example

- ``validation.R``
- ``validation-kebnekaise.sh``
- ``validation-rackham.sh``

## Serial example

- ``serial.R``
- ``serial-kebnekaise.sh``
- ``serial-rackham.sh``

## Serial summing example

- ``serial_sum.R``
