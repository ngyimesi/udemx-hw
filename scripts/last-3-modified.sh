#!/bin/sh
ls -lat /var/log | grep -v "\.$" | head -n 4 | tail -n 3 >  mod-$(date +"%Y-%m-%d").out
