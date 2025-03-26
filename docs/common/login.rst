.. _common-login:

Log in session 
==============

.. admonition:: Goal

    - The goal of this optional sessions is to make sure that you have fulledfilled the 

        - `Prerequisites <https://uppmax.github.io/R-matlab-julia-HPC/prereqs.html>`_

        - `Preparations of environment <https://uppmax.github.io/R-matlab-julia-HPC/preparations.html>`_ to follow this course:

            - you can log in
            - you can start a text editor

    - We will also download exercise snippets and solutions that you can work with. `Use the tarball with exercises <https://uppmax.github.io/R-matlab-julia-HPC/common/use_tarball.html>`_

    - If/when you have done all this, see you at 10:00 sharp! Else, see you in this session.

.. admonition:: Cluster-specific approaches

   - The course is a cooperation between **UPPMAX** (Rackham, Snowy, Bianca), **HPC2N** (Kebnekaise), and **LUNARC** (Cosmos) and will focus on the compute systems at all these centres, as well as select resources at NSC (Tetralith) and PDC (Dardel).
   - Although there are differences we will only have **few separate sessions**.
   - Most participants will use NSC's or Dardel's systems for the course, as Rackham, Kebnekaise and Cosmos are only for local (UU, UmU, IRF, MIUN, SLU, LTU, LU) users.
   - The general information given in the course will be true for all/most HPC centres in Sweden. 

      - The examples will often have specific information, like module names and versions, which may vary. What you learn here should help you to make any changes needed for the other centres. 
      - When present, links to the Julia/R/Matlab documentation at other NAISS centres are given in the corresponding session.

.. note::

   - You were invited to be part of the course project.
   - If you already have research projects in any of the clusters you can use them. The CPU-hours required during the course will be low!

.. admonition:: **Learning outcomes**
   
   - Be able to login, where you are

.. tip:: 

   - If you have user account and *research* project on Kebnekaise, follow the **HPC2N** track below.
   - If you have user account and *research* project on Cosmos, follow the **LUNARC** track below.
   - If you have user account and course/research project on Rackham, follow the **UPPMAX** track below.
   - If you have user account and course/research project on Tetralith, follow the **NSC** track below.
   - If you have user account and course/research project on Dardel, follow the **PDC** track below.

.. admonition:: Use Thinlinc or terminal?

   - It is up to you!
   - Graphics come easier with Thinlinc
   - For this course, when having many windows open, it may sometimes be better to run in terminal, for screen space issues.

Step 1: Log in!
---------------

For beginners: use the **bold** login method.

+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| HPC cluster| Login method [*]         | Documentation                                                                                          | Video                                                      |
+============+==========================+========================================================================================================+============================================================+
| COSMOS     | SSH client               | `here <https://lunarc-documentation.readthedocs.io/en/latest/getting_started/login_howto/>`__          | `here <https://youtu.be/sMsenzWERTg>`__                    |
+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| COSMOS     |**Local ThinLinc client** | `here <https://lunarc-documentation.readthedocs.io/en/latest/getting_started/using_hpc_desktop/>`__    | `here <https://youtu.be/wn7TgElj_Ng>`__                    |
+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Dardel     | **SSH client**           | `here <https://support.pdc.kth.se/doc/contact/contact_support/?sub=login/ssh_login/>`__                                | `here <https://youtu.be/I8cNqiYuA-4?si=MDKS4wEB1nQODvxj>`__|
+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Dardel     | Local ThinLinc client    | `here <https://support.pdc.kth.se/doc/contact/contact_support/?sub=login/interactive_hpc/>`__                          |  `here <https://youtu.be/0Rm-HmyzDfs>`__                   |
+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Kebnekaise | SSH client               | `here <https://docs.hpc2n.umu.se/documentation/access/>`__                                             | `here <https://youtu.be/pIiKOKBHIeY?si=2MVHoFeAI_wQmrtN>`__|
+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Kebnekaise | Local ThinLinc client    | `here <https://docs.hpc2n.umu.se/documentation/access/>`__                                             | `here <https://youtu.be/_jpj0GW9ASc?si=1k0ZnXABbhUm0px6>`__|
+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Kebnekaise |**Remote desktop website**| `here <https://docs.hpc2n.umu.se/documentation/access/>`__                                             | `here <https://youtu.be/_O4dQn8zPaw?si=z32av8XY81WmfMAW>`__|
+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Rackham    | SSH client               | `here <https://docs.uppmax.uu.se/getting_started/login_rackham_remote_desktop_local_thinlinc_client>`__| `here <https://youtu.be/TSVGSKyt2bQ>`__                    |
+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Rackham    | Local ThinLinc client    | `here <https://docs.uppmax.uu.se/getting_started/login_rackham_console_password/>`__                   | `here <https://youtu.be/PqEpsn74l0g>`__                    |
+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Rackham    |**Remote desktop website**| `here <https://docs.uppmax.uu.se/getting_started/login_rackham_remote_desktop_website/>`__             | `here <https://youtu.be/HQ2iuKRPabc>`__                    |
+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Tetralith  | SSH client               | `here <https://www.nsc.liu.se/support/getting-started/>`__                                             | `here <https://youtu.be/wtGIzSBiulY?si=ejx1QEcYXI_bMSoM>`__|
+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Tetralith  |**Local ThinLinc client** | `here <https://www.nsc.liu.se/support/graphics/>`__. Scroll down to ThinLinc                           | `here <https://youtu.be/JsHzQSFNGxY?si=gLI0GEiFiUZ-F__T>`__|
+------------+--------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+


.. admonition:: What are the differences between these login methods?
    :class: dropdown

    These are the ways to access your HPC cluster and some of their features:

    +---------------------------------------------+---------------------------------------------------------------------------------------------------+----------------------------------------------------------------------+
    | How to access your HPC cluster              | Features                                                                                          |How it looks like                                                     |
    +=============================================+===================================================================================================+======================================================================+
    | Remote desktop via a website                | Familiar remote desktop, clumsy, clunky, no need to install software, not available at all centers| .. figure:: ../img/rackham_remote_desktop_via_website_480_x_270.png  |
    +---------------------------------------------+---------------------------------------------------------------------------------------------------+----------------------------------------------------------------------+
    | Remote desktop via a local ThinLinc client  | Familiar remote desktop, clumsy, need to install ThinLinc                                         | .. figure:: ../img/thinlinc_local_rackham_zoom.png                   |
    +---------------------------------------------+---------------------------------------------------------------------------------------------------+----------------------------------------------------------------------+
    | Console environment using an SSH client     | A console environment, powerful, need to install an SSH client                                    | .. figure:: ../img/login_rackham_via_terminal_terminal_409_x_290.png |
    +---------------------------------------------+---------------------------------------------------------------------------------------------------+----------------------------------------------------------------------+

.. type-along::
  
   - Please log in to Rackham, Kebnekaise, or other cluster that you are using.

   .. admonition:: Use Thinlinc or terminal?

      - It is up to you! (Except on Dardel---then just use terminal)
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
         
               $ mkdir /proj/r-matlab-julia-uppmax/mrspock/

      .. tab:: HPC2N

         - Kebnekaise through terminal: ``<user>@kebnekaise.hpc2n.umu.se``     
         - Kebnekaise through ThinLinc, use: ``<user>@kebnekaise-tl.hpc2n.umu.se``
   
         - Create a working directory where you can code along.    
      
           - Example. If your username is bbrydsoe and you are at HPC2N, then we recommend you create this folder: 
     
           .. code-block:: console
         
              $ mkdir /proj/nobackup/r-matlab-julia/bbrydsoe/

      .. tab:: LUNARC

         - Cosmos through terminal: ``<user>@cosmos.lunarc.lu.se``     
         - Cosmos through ThinLinc, use: ``<user>@cosmos-dt.lunarc.lu.se``

         - Create a working directory in your home space where you can code along.    
      
           - Example. Create this folder: 

           .. code-block:: console
         
              $ mkdir $HOME/r-matlab-julia

      .. tab:: NSC

         - Tetralith through terminal or Thinlinc: ``<user>@tetralith.nsc.liu.se``

         - Create a working directory where you can code along.    
      
           - Example. If your username is jlpicard and you are at NSC, then we recommend you create this folder: 
     
           .. code-block:: console
         
              $ mkdir /proj/r-matlab-julia-naiss/jlpicard

      .. tab:: PDC

         - Dardel through terminal: ``<user>@dardel.pdc.kth.se``     
         - Dardel through ThinLinc: ``<user>@dardel-vnc.pdc.kth.se``

            - **Warning!** Only 30 Dardel users at a time can use ThinLinc. Do not count on it being available.
   
         - Create a working directory where you can code along.
      
           - Example. If your username is sevenof9 and you are at PDC, then we recommend you create this folder: 
     
           .. code-block:: console
         
              $ mkdir /cfs/klemming/projects/supr/r-matlab-julia-naiss/sevenof9/


Test an editor
--------------

Learn how to use an text editor at :ref:`common-use-text-editor`.

Download and extract the tarball with exercises 
-----------------------------------------------

Learn how to download and extract the tarball with exercises
at :ref:`common-use-tarball`.
