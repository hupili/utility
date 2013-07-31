#!/bin/bash
# Send attachment by mutt

if [[ $# -ge 2 ]]; then
	file=$1
	recipient=$2
	if [[ $# == 3 ]]; then
		subject=$3
	else
		subject="New File Sent to you"
	fi
else
	echo "usage: $0 {file} {recipient} [{subject}]"
	exit 255
fi

mutt -F /dev/null -s "$subject" -a "$file" -- "$recipient" < /dev/null
