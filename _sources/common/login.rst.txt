Log in session 
==============

.. admonition:: Goal

    The goal of this optional sessions is to make sure that
    you have fulledfilled the 
    `prerequisites <https://uppmax.github.io/R-python-julia-matlab-HPC/prereqs.html>`_
    to follow this course:

    - you can log in
    - you can start a text editor

    If you can, see you at 10:00 sharp! Else, see you in this session.

.. admonition:: Cluster-specific approaches

   - The course is a cooperation between **UPPMAX** (Rackham, Snowy, Bianca), **HPC2N** (Kebnekaise) and **LUNARC** (Cosmos) and will focus on the compute systems at all these centres.
   - Although there are differences we will only have **few seperate sessions**.
   - Most participants will use UPPMAX's systems for the course, as Kebnekaise and Cosmos are only for local (UmU, IRF, MIUN, SLU, LTU, LU) users.
   - The general information given in the course will be true for all/most HPC centres in Sweden. 

      - The examples will often have specific information, like module names and versions, which may vary. What you learn here should help you to make any changes needed for the other centres. 
      - When present, links to the Python/Julia/R/Matlab documentation at other NAISS centres are given in the corresponding session.

.. note::

   - You were invited to be part of the course project for Rackham/Snowy (UPPMAX).
   - If you already have research projects in any of the clusters you can use them. The CPU-hours required during the course will be low!

.. admonition:: **Learning outcomes**
   
   - Be able to login, where you are

.. tip:: 

   - If you have user account and _research_ project on Kebnekaise, follow the **HPC2N** track below.
   - If you have user account and _research_ project on Cosmos, follow the **LUNARC** track below.
   - If you have user account and course/research project on Rackham, follow the **UPPMAX** track below.


Log in!
-------

+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| HPC Center | Method                 | Documentation                                                                                          | Video                                                      |
+============+========================+========================================================================================================+============================================================+
| HPC2N      | SSH                    | `here <https://docs.hpc2n.umu.se/documentation/access/>`_                                              | `here <https://youtu.be/pIiKOKBHIeY?si=2MVHoFeAI_wQmrtN>`_ |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| HPC2N      | Local ThinLinc client  | `here <https://docs.hpc2n.umu.se/documentation/access/>`_                                              | `here <https://youtu.be/_jpj0GW9ASc?si=1k0ZnXABbhUm0px6>`_ |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| HPC2N      | Remote desktop website | `here <https://docs.hpc2n.umu.se/documentation/access/>`_                                              | `here <https://youtu.be/_O4dQn8zPaw?si=z32av8XY81WmfMAW>`_ |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| LUNARC     | SSH                    | `here <https://lunarc-documentation.readthedocs.io/en/latest/getting_started/login_howto/>`_           | `here <https://youtu.be/sMsenzWERTg>`_                     |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| LUNARC     | Local ThinLinc client  | `here <https://lunarc-documentation.readthedocs.io/en/latest/getting_started/using_hpc_desktop/>`_     | `here <https://youtu.be/wn7TgElj_Ng>`_                     |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| UPPMAX     | SSH                    | `here <https://docs.uppmax.uu.se/getting_started/login_rackham_remote_desktop_local_thinlinc_client>`_ | `here <https://youtu.be/TSVGSKyt2bQ>`_                     |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| UPPMAX     | Local ThinLinc client  | `here <https://docs.uppmax.uu.se/getting_started/login_rackham_console_password/>`_                    | `here <https://youtu.be/PqEpsn74l0g>`_                     |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| UPPMAX     | Remote desktop website | `here <https://docs.uppmax.uu.se/getting_started/login_rackham_remote_desktop_website/>`_              | `here <https://youtu.be/HQ2iuKRPabc>`_                     |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+

.. type-along::
  
   - Please log in to Rackham, Kebnekaise or other cluster that you are using.

   .. admonition:: Use Thinlinc or terminal?

      - It is up to you!
      - Graphics come easier with ThinLinc
      - For this course, when having many windows open, it may be better to run in terminal, for screen space issues.


   .. tabs::

      .. tab:: UPPMAX

         1. Log in to Rackham!

           - Terminal: ``ssh -X <user>@rackham.uppmax.uu.se`` 
      
           - ThinLinc app: ``<user>@rackham-gui.uppmax.uu.se``
           - ThinLinc in web browser: ``https://rackham-gui.uppmax.uu.se``
      
         2. If not already: **create a working directory** where you can code along.

           - We recommend creating it under the course project storage directory
   
         3. Example. If your username is "mrspock" and you are at UPPMAX, then we recommend you create this folder: 
     
            .. code-block:: console
         
               $ mkdir /proj/r-py-jl-m-rackham/mrspock/

      .. tab:: HPC2N

         - Kebnekaise through terminal: ``<user>@kebnekaise.hpc2n.umu.se``     
         - Kebnekaise through ThinLinc, use: ``<user>@kebnekaise-tl.hpc2n.umu.se``
   
         - Create a working directory where you can code along.    
      
           - Example. If your username is bbrydsoe and you are at HPC2N, then we recommend you create this folder: 
     
           .. code-block:: console
         
              $ mkdir /proj/nobackup/r-py-jl-m/bbrydsoe/

      .. tab:: LUNARC

         - Cosmos through terminal: ``<user>@cosmos.lunarc.lu.se``     
         - Cosmos through ThinLinc, use: ``<user>@cosmos-dt.lunarc.lu.se``

         - Create a working directory where you can code along.    
      
           - Example. Create this folder: 

           .. code-block:: console
         
              $ mkdir $HOME/r-py-jl-m

Test an editor
--------------

The clusters provide these text editors on the command line:

- nano
- vi, vim
- emacs

We recommend ``nano`` unless you are used to another editor:

- `Text editors at HPC2N <https://docs.hpc2n.umu.se/tutorials/linuxguide/#editors>`_ 
- `Text editors at UPPMAX <http://docs.uppmax.uu.se/software/text_editors/>`_ 
  - Any of the above links would be helpful for you.

.. challenge::

   - Let's make a script with the name ``example.py``  

   .. code-block:: console

      $ nano example.py

   - Insert the following text

   .. code-block:: python

      # This program prints Hello, world!
      print('Hello, world!')

   - Save and exit. In nano: ``<ctrl>+O``, ``<ctrl>+X``

   You can run a python script in the shell like this:

   .. code-block:: console

      $ python example.py
      # or 
      $ python3 example.py

