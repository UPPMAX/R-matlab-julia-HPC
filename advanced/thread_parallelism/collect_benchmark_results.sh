#!/bin/bash
grep -EoRh "^[jmlr].*,.*" --include=*.out | sort | uniq
