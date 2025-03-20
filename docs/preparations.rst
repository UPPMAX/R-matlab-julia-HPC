Prepare the environment
=======================

.. admonition:: Goal

    The goal of this page to make sure you can follow the course.

These are the things you need to follow the course:

- you can log in to at least one HPC cluster, in at least one way
- you can start a text editor

These are discussed in detail below.

.. note::

   - There will be an opportunity to get help with log in every morning of the workshop at 9:00.
   - You are also welcome to join the On-boarding at 13:00 the day before the ordinary program starts.

Log in to one of the HPC systems covered in this course
-------------------------------------------------------

Below is an overview of where to find the documentation and a video showing
the procedure. Some procedures have waiting steps of one or more days,
so prefer to start early.

+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| HPC cluster| Login method [*]       | Documentation                                                                                          | Video                                                      |
+============+========================+========================================================================================================+============================================================+
| COSMOS     | SSH                    | `here <https://lunarc-documentation.readthedocs.io/en/latest/getting_started/login_howto/>`_           | `here <https://youtu.be/sMsenzWERTg>`_                     |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| COSMOS     | Local ThinLinc client  | `here <https://lunarc-documentation.readthedocs.io/en/latest/getting_started/using_hpc_desktop/>`_     | `here <https://youtu.be/wn7TgElj_Ng>`_                     |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Dardel     | SSH                    | `here <https://www.nsc.liu.se/support/getting-started/>`_                                              | `here <https://youtu.be/I8cNqiYuA-4?si=MDKS4wEB1nQODvxj>`_ |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Dardel     | Local ThinLinc client  | `here <https://www.nsc.liu.se/support/graphics/>`_ . Scroll down to ThinLinc                           |                                                            |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Kebnekaise | SSH                    | `here <https://docs.hpc2n.umu.se/documentation/access/>`_                                              | `here <https://youtu.be/pIiKOKBHIeY?si=2MVHoFeAI_wQmrtN>`_ |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Kebnekaise | Local ThinLinc client  | `here <https://docs.hpc2n.umu.se/documentation/access/>`_                                              | `here <https://youtu.be/_jpj0GW9ASc?si=1k0ZnXABbhUm0px6>`_ |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Kebnekaise | Remote desktop website | `here <https://docs.hpc2n.umu.se/documentation/access/>`_                                              | `here <https://youtu.be/_O4dQn8zPaw?si=z32av8XY81WmfMAW>`_ |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Rackham    | SSH                    | `here <https://docs.uppmax.uu.se/getting_started/login_rackham_remote_desktop_local_thinlinc_client>`_ | `here <https://youtu.be/TSVGSKyt2bQ>`_                     |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Rackham    | Local ThinLinc client  | `here <https://docs.uppmax.uu.se/getting_started/login_rackham_console_password/>`_                    | `here <https://youtu.be/PqEpsn74l0g>`_                     |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Rackham    | Remote desktop website | `here <https://docs.uppmax.uu.se/getting_started/login_rackham_remote_desktop_website/>`_              | `here <https://youtu.be/HQ2iuKRPabc>`_                     |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Tetralith  | SSH                    | `here <https://www.nsc.liu.se/support/getting-started/>`_                                              | `here <https://youtu.be/wtGIzSBiulY?si=ejx1QEcYXI_bMSoM>`_ |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Tetralith  | Local ThinLinc client  | `here <https://www.nsc.liu.se/support/graphics/>`_ . Scroll down to ThinLinc                           | `here <https://youtu.be/JsHzQSFNGxY?si=gLI0GEiFiUZ-F__T>`_ |
+------------+------------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------+

.. admonition:: What are the differences between these login methods?
    :class: dropdown

    These are the ways to access your HPC cluster and some of their features:

    +---------------------------------------------+---------------------------------------------------------------------------------------------------+-------------------------------------------------------------------+
    | How to access your HPC cluster              | Features                                                                                          |How it looks like                                                  |
    +=============================================+===================================================================================================+===================================================================+
    | Remote desktop via a website                | Familiar remote desktop, clumsy, clunky, no need to install software, not available at all centers| .. figure:: img/rackham_remote_desktop_via_website_480_x_270.png  |
    +---------------------------------------------+---------------------------------------------------------------------------------------------------+-------------------------------------------------------------------+
    | Remote desktop via a local ThinLinc client  | Familiar remote desktop, clumsy, need to install ThinLinc                                         | .. figure:: img/thinlinc_local_rackham_zoom.png                   |
    +---------------------------------------------+---------------------------------------------------------------------------------------------------+-------------------------------------------------------------------+
    | Console environment using an SSH client     | A console environment, powerful, need to install an SSH client                                    | .. figure:: img/login_rackham_via_terminal_terminal_409_x_290.png |
    +---------------------------------------------+---------------------------------------------------------------------------------------------------+-------------------------------------------------------------------+

Need help? Contact support:

+------------+------------+-----------------------------------------------------------------------------------------------+
|HPC cluster |HPC Center  | How to contact support                                                                        |
+============+============+===============================================================================================+
|COSMOS      | LUNARC     | `Contact LUNARC support <https://www.lunarc.lu.se/getting-help/>`_                            |
+------------+------------+-----------+-----------------------------------------------------------------------------------+
|Dardel      | PDC        | `Contact PDC support <https://support.pdc.kth.se/doc/support/?sub=contact/contact_support/>`_ |
+------------+------------+-----------------------------------------------------------------------------------------------+
|Kebnekaise  | HPC2N      | `Contact HPC2N support <https://docs.hpc2n.umu.se/support/contact/>`_                         |
+------------+------------+-----------+-----------------------------------------------------------------------------------+
|Rackham     | UPPMAX     | `Contact UPPMAX support <https://docs.uppmax.uu.se/support/>`_                                |
+------------+------------+-----------+-----------------------------------------------------------------------------------+
|Tetralith   | NSC        | `Contact NSC support <https://www.nsc.liu.se/support/>`_                                      |
+------------+------------+-----------+-----------------------------------------------------------------------------------+

Start a text editor
-------------------

After logging in to your HPC cluster, start a terminal
and type :code:`nano` to start a text editor.

- CTRL-O: save
- CTRL-X: quit

