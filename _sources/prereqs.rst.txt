Pre-requirements
================

.. admonition:: Goal

    The goal of this page to make sure you can follow the course.

These are the things you need to follow the course:

- you can log in to at least one HPC cluster, in at least one way
- you can start a text editor

These are discussed in detail below

.. note::

   - There will be an opportunity to get help with log in every morning of the workshop at 9:00.
   - You are also welcome to join the On-boarding at 13:00 the day before the ordinary program starts.

Log in to one of the HPC systems covered in this course
-------------------------------------------------------

These are the ways to access your HPC cluster and how that looks like:

+---------------------------------------------+-------------------------------------------------------------------+
| How to access your HPC cluster              | How it looks like                                                 |
+=============================================+===================================================================+
| Remote desktop via a website                | .. figure:: img/rackham_remote_desktop_via_website_480_x_270.png  |
+---------------------------------------------+-------------------------------------------------------------------+
| Remote desktop via a local ThinLinc client  | .. figure:: img/thinlinc_local_rackham_zoom.png                   |
+---------------------------------------------+-------------------------------------------------------------------+
| Console environment using an SSH client     | .. figure:: img/login_rackham_via_terminal_terminal_409_x_290.png |
+---------------------------------------------+-------------------------------------------------------------------+

These are the ways to access your HPC cluster and some of their features:

+---------------------------------------------+-------------------------------------------------------------------+
| How to access your HPC cluster              | Features                                                          |
+=============================================+===================================================================+
| Remote desktop via a website                | Familiar remote desktop                                           |
+---------------------------------------------+-------------------------------------------------------------------+
|                                             | Clumsy and clunky                                                 |
+---------------------------------------------+-------------------------------------------------------------------+
|                                             | Slow on UPPMAX                                                    |
+---------------------------------------------+-------------------------------------------------------------------+
|                                             | No need to install software                                       |
+---------------------------------------------+-------------------------------------------------------------------+
|                                             | Works on HPC2N and UPPMAX                                         |
+---------------------------------------------+-------------------------------------------------------------------+
|                                             | Needs 2FA for UPPMAX                                              |
+---------------------------------------------+-------------------------------------------------------------------+
| Remote desktop via a local ThinLinc client  | Familiar remote desktop                                           |
+---------------------------------------------+-------------------------------------------------------------------+
|                                             | Clumsy                                                            |
+---------------------------------------------+-------------------------------------------------------------------+
|                                             | Need to install ThinLinc                                          |
+---------------------------------------------+-------------------------------------------------------------------+
|                                             | Works on all centers                                              |
+---------------------------------------------+-------------------------------------------------------------------+
|                                             | Needs 2FA for UPPMAX                                              |
+---------------------------------------------+-------------------------------------------------------------------+
| Console environment using an SSH client     | A console environment may be unfamiliar                           |
+---------------------------------------------+-------------------------------------------------------------------+
|                                             | Great to use                                                      |
+---------------------------------------------+-------------------------------------------------------------------+
|                                             | Need to install an SSH client                                     |
+---------------------------------------------+-------------------------------------------------------------------+
|                                             | Works on all centers                                              |
+---------------------------------------------+-------------------------------------------------------------------+

Here is an overview of where to find the documentation and a video showing the procedure:

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

Need help? Contact support:

+------------+-----------------------------------------------------------------------+
| HPC Center | How to contact support                                                |
+============+=======================================================================+
| HPC2N      | `Contact HPC2N support <https://docs.hpc2n.umu.se/support/contact/>`_ |
+------------+------------------------+----------------------------------------------+
| LUNARC     | `Contact LUNARC support <https://www.lunarc.lu.se/getting-help/>`_    |
+------------+------------------------+----------------------------------------------+
| UPPMAX     | `Contact UPPMAX support <https://docs.uppmax.uu.se/support/>`_        |
+------------+------------------------+----------------------------------------------+

Use a text editor
-----------------

All clusters provide the most common command-line text editors.
We recommend ``nano`` unless you are used to another editor:

- `HPC2N documentation on text editors <https://docs.hpc2n.umu.se/tutorials/linuxguide/#editors>`_ 
- `UPPMAX documentation on text editors <http://docs.uppmax.uu.se/software/text_editors/>`_ 
- LUNARC does not have documentation on text editors (yet), but any other
  center's documentation will work

Get familiar with the Linux/Bash command line
---------------------------------------------

- `Short introductions <https://uppsala.instructure.com/courses/67267/pages/using-the-command-line-bash?module_item_id=455632>`_
- `Linux "cheat sheet" <https://www.hpc2n.umu.se/documentation/guides/linux-cheat-sheet>`_
- UPPMAX
    
  - `Linux <http://docs.uppmax.uu.se/getting_started/linux/>`_
  - `Basic commands <http://docs.uppmax.uu.se/getting_started/linux_basics/>`_
  - `Whole intro course material <https://www.uppmax.uu.se/support/courses-and-workshops/uppmax-introductory-course/>`_
      
- HPC2N
    
  - `HPC2N's intro course material (including link to recordings) <https://github.com/hpc2n/intro-course>`_
  - `HPC2N's YouTube channel video on Linux <https://www.youtube.com/watch?v=gq4Dvt2LeDg>`_

- LUNARC
    - Any of the above links would be helpful for you
