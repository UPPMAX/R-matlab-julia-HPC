# R, MATLAB, and Julia in HPC---sphinx-myst experimental version

This subdirectory contains an experimental version of this material using yet another
alternative docs-building system, Sphinx with MyST. This is because Linus found that
mkdocs doesn't have a real alternative to sphinx-prompt, but also found Markdown to be
easier to read and write than reStructuredText.

Whether or not this is the way forward is too early to have a firm opinion about at the
time of writing this (and going on vacation). I'm intrigued by the idea of being able to
include pages written as code notebooks; sphinx has nbsphinx for Jupyter notebooks but my
preferred Pluto notebooks may be unlikely to get support here. I have not yet looked into
the usage of Franklin.jl, any other Julia solutions, or mkdocs extensions for notebooks.

Or Hugo, or any other static site generator. The Hugo website loads incredibly quickly,
which is a much nicer user experience than the normal slowness of web pages, that should
be taken into account.


## Build locally

Clone the repository and navigate to this folder, not the root of the repo:

```console
git clone https://github.com/UPPMAX/R-matlab-julia-HPC.git
cd R-matlab-julia-HPC/sphinx-myst_test/
```

Create a python venv and activate it:

```console
mkdir env
python -m venv env
source env/bin/activate
```

> [!TIP]
> Add `env/` to your `~/.gitignore`, environments are meant to be reproduced from
> specifications and not meant to be checked in to version control.

In your new venv (your console prompt should assure you it has been properly activated),
update pip and install the requirements:

```console
pip install --upgrade pip
pip install -r requirements.txt
```

You may have to deactivate and reactivate the venv at this point to make bash find
`mkdocs`, even if `which` does find `mkdocs`.

Build and deploy the website, from this project's root folder:

```console
mkdocs serve
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
