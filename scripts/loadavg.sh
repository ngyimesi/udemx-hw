#!/bin/sh
cat /proc/loadavg | cut -d " " -f3 > loadavg-$(date +"%Y-%m-%d").out
