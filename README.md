# R, MATLAB, and Julia in HPC

[![Check links](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/check_links.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/check_links.yaml)
[![Check spelling](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/check_spelling.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/check_spelling.yaml)
[![Create website](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/create_website.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/create_website.yaml)

This repository contains the source code for the UPPMAX/HPC2N [R, MATLAB, and Julia in HPC course](https://uppmax.github.io/R-matlab-julia-HPC/)

## Getting PDFs of the material

You can clone the repository: ``git clone https://github.com/UPPMAX/R-matlab-julia-HPC.git``

After doing that, you can convert the .rst files to .pdf files with this online tool: https://cloudconvert.com/rst-to-pdf

The documentation files you see on the rendered pages (https://uppmax.github.io/R-matlab-julia-HPC/) are found under ``R-matlab-julia-HPC/docs/<language>``.

## Build locally

Clone the repository and navigate to the root of it:

```bash
$ git clone https://github.com/UPPMAX/R-matlab-julia-HPC.git
$ cd R-matlab-julia-HPC
```

Create a python venv and activate it:

```bash
$ mkdir env
$ python -m venv env
$ source env/bin/activate
```

Update pip in the venv and install the requirements:
```bash
(env) $ pip install --upgrade pip
(env) $ pip install -r mkdocs-requirements.txt
```

You may have to deactivate and reactivate the venv at this point to make bash find `mkdocs`,
even if `which` does find `mkdocs`.

Build and deploy the website, from this project's root folder:

```bash
(env) $ mkdocs serve
```

## Credits

- The old and online version is built with Sphinx using a theme provided by Read the Docs
- The newer version is built with MkDocs using the ReadTheDocs theme

## Files used by continuous integration scripts

Filename                           |Descriptions
-----------------------------------|------------------------------------------------------------------------------------------------------
[.lycheeignore](.lycheeignore)     |URLs ignored by the link checker
[.spellcheck.yml](.spellcheck.yml) |Configuration of the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.wordlist.txt](.wordlist.txt)     |Whitelisted words for the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally

## Links

 * [online ReStructedText table editor and generator](https://tableconvert.com/restructuredtext-generator)
