Packages at Bianca (parallel session)
=====================================

.. admonition::  R libraries AKA R packages

   - UPPMAX have very many pre-installed packages
   - This is helpful especially for Bianca (with no internet)
   - You can install own packages on Bianca as well.

.. questions::

   - How to check for and use the UPPMAX pre-installed packages?
   - How to install packages on Bianca?
   
.. objectives:: 

   - Show how to check for R packages
   - Show how to install own packages on Bianca


Check current available packages
--------------------------------

On UPPMAX the module ``R_packages`` is a package library containing almost all packages in the CRAN and BioConductor repositories. As of 2023-10-11 there are a total of:

   - A total of 23476 R packages are installed
   - A total of 23535 packages are available in CRAN and BioConductor
   
      - 19809 CRAN packages are installed, out of 19976 available
      - 3544 BioConductor-specific packages are installed, out of 3559 available
   - 121 other R packages are installed. These are not in CRAN/BioConductor, are only available in the CRAN/BioConductor archives, or are hosted on github, gitlab or elsewhere


There are many different ways to check if the package you are after is already installed - chances are it is! The simplest way is probably to simply try loading the package from within ``R``
.. code-block:: R

   library(package-name)


Install own packages on Bianca
------------------------------

- If an R package is not not available on Bianca already (like Conda repositories) you may have to use the wharf to install the library/package

   - `Installing R packages on Bianca <https://uppmax.github.io/bianca_workshop/extra/rpackages/>`_
