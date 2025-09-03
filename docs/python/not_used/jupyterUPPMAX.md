# Running Jupyter on compute nodes

```{callout} What is Jupyter?
  - "The Jupyter Notebook is the original web application for creating and sharing computational documents. It offers a simple, streamlined, document-centric experience."
    - Run python interactively and make a "story" document with text and code and figures woven together.
    - Includes file manager
  - You run it in a **web browser** (``firefox`` at UPPMAX)

  - The Jupyter project site contains a lot of information and inspiration. <https://jupyter.org/>
  - The Jupyter Notebook documentation. <https://jupyter-notebook.readthedocs.io/en/stable/>
```


## On the compute nodes

## 1. Start an interactive session from the login node

``` bash
# For Rackham
$ interactive -A snic-project  -t 4:00:00

# For Snowy
$ interactive -M snowy -A snic-project  -t 4:00:00
```

## 2. Start jupyter notebook from the interactive session (*when it gets allocated*)

``` bash
module load python/3.9.5
jupyter notebook --ip 0.0.0.0 --no-browser
```

## 3. Connect to the running notebook

Keep this session open and running. Note the node on which you are got the interactive job i.e. something like "r141".

- If you are connected to Rackham via [Thinlinc session](https://docs.uppmax.uu.se/software/thinlinc/), open a browser with the link you got but modified to point to r141 i.e.
<http://r141:8888/?token=5c3aeee9fbfc75f7a11c4a64b2b5b7ec49622231388241c2>
- If you use ssh to connect to Rackham, you need to forward the port of the interactive node to your local computer.
    - On Linux or Mac this is done by running in another terminal. Make sure you have the ports changed if they are not at the default 8888.

        ``` bash
        ssh -L 8888:r141:8888 username@rackham.uppmax.uu.se
        ```

    - If you use PuTTY - you need to change the settings in "Tunnels" accordingly (could be done for the current connection as well).
    ![](../../../img/putty.png)
    <https://uplogix.com/docs/local-manager-user-guide/advanced-features/ssh-port-forwarding>


    On your computer open  the address you got but replace r141 with localhost i.e.
<http://localhost:8888/?token=5c3aeee9fbfc75f7a11c4a64b2b5b7ec49622231388241c2>

    This should bring the jupyter interface on your computer and all calculations and files will be on Rackham.
