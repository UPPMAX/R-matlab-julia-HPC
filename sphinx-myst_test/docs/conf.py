# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Introduction to running R, MATLAB and Julia in HPC'
copyright = '2025, UPPMAX & HPC2N'
author = 'NAISS'
github_user = "UPPMAX"
github_repo_name = "R-matlab-julia-HPC"  # auto-detected from dirname if blank                                       NEEDED FOR "Edit on GitHub to work"
github_version = "main"
conf_py_path = "/docs/" 
# The full version, including alpha/beta/rc tags
release = '3.0-alpha'


# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ["myst_parser"]
myst_enable_extensions = ["colon_fence"]
templates_path = ['_templates']
exclude_patterns = []



# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'furo'
html_static_path = ['_static']
