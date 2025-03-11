# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# import sphinx_rtd_theme
# sys.path.insert(0, os.path.abspath('.'))


# -- Project information -----------------------------------------------------

project = 'Introduction to running R, Python, Julia and MATLAB in HPC'
copyright = '2025, UPPMAX & HPC2N'
author = 'NAISS'
github_user = "UPPMAX"
github_repo_name = "R-python-julia-MATLAB-HPC"  # auto-detected from dirname if blank                                       NEEDED FOR "Edit on GitHub to work"
github_version = "main"
conf_py_path = "/docs/" 
# The full version, including alpha/beta/rc tags
release = '2.0'


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = ["sphinx_lesson",
    "sphinx.ext.githubpages",
    "sphinx_rtd_theme_ext_color_contrast",
    "sphinxemoji.sphinxemoji",
    'sphinx-prompt',
    'sphinx_design',
    'sphinx_copybutton',
    'sphinxcontrib.plantuml',
    'sphinx.ext.graphviz',
    'sphinxcontrib.mermaid',
]

mermaid_output_format = 'raq'
mermaid_output_format = "png"
mermaid_params = [
    "--theme",
    "forest",
    "--backgroundColor",
    "transparent",
]

jupyter_execute_notebooks = "cache"

myst_enable_extensions = [
    "amsmath",
    "colon_fence",
    "deflist",
    "dollarmath",
    "html_admonition",
    "html_image",
    "replacements",
    "smartquotes",
    "substitution",
    "tasklist",
]

copybutton_exclude = '.linenos, .gp, .go'

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = [
    "README*",
    "_build",
    "Thumbs.db",
    ".DS_Store",
    "jupyter_execute",
    "*venv*",
]


# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'
html_logo = "../img/hpc2n-lunarc-uppmax-hpc-course.png"

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']
def setup(app):
    app.add_css_file('custom_theme.css')

# HTML context:
from os.path import basename, dirname, realpath

html_context = {
    "display_github": True,
    "github_user": github_user,
    # Auto-detect directory name.  This can break, but
    # useful as a default.
    # "github_repo": github_repo_name or basename(dirname(realpath(__file__))),
    # Richel: trying to fix 'Edit on GitHub link' onhttps://uppmax.github.io/R-python-julia-HPC/index.html
    "github_repo": github_repo_name or basename(dirname(realpath(__file__))),
    "github_version": github_version,
    "conf_py_path": conf_py_path,
}
