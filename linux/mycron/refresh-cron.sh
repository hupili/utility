#!/bin/bash

dir="enabled"

cat $dir/*.cron > tmp.cron
crontab tmp.cron
echo "ret: $?"
