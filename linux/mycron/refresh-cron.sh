#!/bin/bash

dir="enabled"

cat $dir/*.cron > tmp.cron
crontab tmp.cron
echo "Add to crontab. Return: $?"
rm -f tmp.cron
