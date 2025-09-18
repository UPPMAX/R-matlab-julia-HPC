# R, MATLAB, and Julia in HPC

[![Check links](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/check_links.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/check_links.yaml)
[![Check Markdown](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/check_markdown.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/check_markdown.yaml)
[![Check spelling](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/check_spelling.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/check_spelling.yaml)
[![Create MkDocs site](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/create_mkdocs_website.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/R-matlab-julia-HPC/actions/workflows/create_mkdocs_website.yaml)

This repository contains the source code for the UPPMAX/HPC2N
[R, MATLAB, and Julia in HPC course](https://uppmax.github.io/R-matlab-julia-HPC/)

## Getting PDFs of the material

You can clone the repository:

```bash
git clone https://github.com/UPPMAX/R-matlab-julia-HPC.git
```

After doing that, you can convert the `.rst` files to `.pdf` files
with this online tool: <https://cloudconvert.com/rst-to-pdf>

The documentation files you see on the rendered pages
(<https://uppmax.github.io/R-matlab-julia-HPC/>)
are found under `R-matlab-julia-HPC/docs/<language>`.

## Build locally

Clone the repository and navigate to the root of it:

```console
git clone https://github.com/UPPMAX/R-matlab-julia-HPC.git
cd R-matlab-julia-HPC
```

Create a Python `venv` and activate it:

```console
mkdir env
python -m venv env
source env/bin/activate
```

> [!TIP]
> Add `env/` to your `~/.gitignore`, environments are meant to be reproduced from
> specifications and not meant to be checked in to version control.

In your new `venv`
(your console prompt should assure you it has been properly activated),
update pip and install the requirements:

```console
pip install --upgrade pip
pip install -r mkdocs-requirements.txt
```

You may have to deactivate and reactivate the `venv`
at this point to make Bash find
`mkdocs`, even if `which` does find `mkdocs`.

Build and deploy the website, from this project's root folder:

```console
mkdocs serve
```

### Building Sphinx version

1. Create and activate separate Python `venv`:

    ```console
    mkdir oldsphinxenv
    python -m venv oldsphinxenv
    source oldsphinxenv/bin/activate
    ```

1. Install the correct requirements for Sphinx:

    ```console
    pip install --upgrade pip
    pip install -r requirements.txt
    ```

1. (I have not seen a case of needing to deactivate and reactivate the `venv` at
   this point for Sphinx.) Build and deploy, automatically choosing an open
   port:

    ```console
    sphinx-autobuild --port 0 docs/ build/
    ```

## Where is it indicated which files are not checked for Markdown style?

In the file [`.markdownlintignore`](.markdownlintignore).

## Where is it indicated which files are not checked for broken URLs?

In the file [`.github/workflows/check_links.yaml` line 34](.github/workflows/check_links.yaml#34).

## Which adminitions work?

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

Theme      |Admonitions test page
-----------|------------------------
ReadTheDocs|[Admonitions test page](https://uppmax.github.io/linux-command-line-201/misc/test_admonitions/)
materials  |[Admonitions test page](https://uppmax.github.io/naiss_intro_python/misc/test_admonitions/)

<!-- markdownlint-enable MD013 -->

## Credits

- The old and online version is built with Sphinx
  using a theme provided by Read the Docs
- The newer version is built with MkDocs
  using the ReadTheDocs theme

## Files used by continuous integration scripts

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

Filename                                    |Descriptions
--------------------------------------------|------------------------------------------------------------------------------------------------------
[`mlc_config.json`](mlc_config.json)        |Configuration of the link checker, use `markdown-link-check --config mlc_config.json --quiet docs/**/*.md` to do link checking locally
[`.spellcheck.yml`](.spellcheck.yml)        | Configuration of the spell checker, use `./scripts/check_spelling.sh` to do spell check locally
[`.wordlist.txt`](.wordlist.txt)            | Whitelisted words for the spell checker, use `./scripts/check_spelling.sh` to do spell check locally
[`.markdownlint.jsonc`](.markdownlint.jsonc)|Configuration of the Markdown linter, use `./scripts/fix_markdown_style_errors.sh` to do markdown linting locally. The name of this file is a default name.
[`.markdownlintignore`](.markdownlintignore)|Files ignored by the Markdown linter, use `./scripts/fix_markdown_style_errors.sh` to do markdown linting locally. The name of this file is a default name.
[.lycheeignore](.lycheeignore)              |?URLs ignored by the link checker

<!-- markdownlint-enable MD013 -->
