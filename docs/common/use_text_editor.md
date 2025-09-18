# Use a text editor

!!! info "nano cheat sheet"

   After logging in to your HPC cluster, start a terminal
   and type `nano` to start the text editor called 'nano'.

- `CTRL-O`: save
- `CTRL-X`: quit

The clusters provide these text editors on the command line:

- nano
- vi, vim
- emacs

We recommend `nano` unless you are used to another editor:

- [Text editors at HPC2N](https://docs.hpc2n.umu.se/tutorials/linuxguide/#editors)
- [Text editors at UPPMAX](http://docs.uppmax.uu.se/software/text_editors/)
- Any of the above links would be helpful for you.

!!! info "Challenge"

    Let's make a script with the name `example.py`:

    ```bash
    nano example.py
    ```

    Insert the following text:

    ```python
    # This program prints Hello, world!
    print('Hello, world!')
    ```

    Save and exit. In nano: `<ctrl>+O`, `<ctrl>+X`

    You can run the Python script in the shell like this:

    ```bash
    python example.py
    ```

    or

    ```bash
    python2 example.py
    ```
