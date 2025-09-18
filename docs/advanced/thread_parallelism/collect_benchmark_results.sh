#!/bin/bash
grep -EoRh ".*,.*" --include=*.out | sort | uniq
