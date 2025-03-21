.. _common-use-text-editor:

Use a text editor
=================

.. admonition:: Nano Cheatsheet

   After logging in to your HPC cluster, start a terminal
   and type :code:`nano` to start the text editor called 'nano'.

   - CTRL-O: save
   - CTRL-X: quit

The clusters provide these text editors on the command line:

- nano
- vi, vim
- emacs

We recommend ``nano`` unless you are used to another editor:

- `Text editors at HPC2N <https://docs.hpc2n.umu.se/tutorials/linuxguide/#editors>`__
- `Text editors at UPPMAX <http://docs.uppmax.uu.se/software/text_editors/>`__
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
