#!/bin/bash
#
# Polls the queue every second
#
while true; do squeue -u $USER ; sleep 1; done
