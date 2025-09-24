#!/bin/bash
#
# Lint the MATLAB code
#
# Usage:
#
#   ./scripts/lint_matlab_code.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/lint_matlab_code.sh"
    echo " "
    exit 42
fi

mh_style docs/advanced/thread_parallelism/do_2d_integration.m

