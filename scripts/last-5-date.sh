#!/bin/sh
find /var/log/ -type f -newermt "$(date --date "5 day ago" +"%Y-%m-%d %H:%M:%S")" >  last_five-$(date +"%Y-%m-%d").out
