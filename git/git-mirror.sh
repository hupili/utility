#!/bin/bash
#
# Sometimes, you want to mirror two repos with all branches and tags.
# This script is for that.
#
# The behaviour is like GitHub's fork function but by pass a major constraint:
#
# * Using GitHub fork, one account can only have one fork from the same root
#
# Sometimes, two repos root from the same repo's fork but you want to retain
# their separate states.

#set -xo

if [[ $# != 2 ]]; then
	echo "Usage: $0 {from-repo} {to-repo}"
	echo "Make sure those two repos exist and you have the right access"
	exit 255
fi

from=$1
to=$2

tmp_dir=$(mktemp -d -t git-mirror-XXXXXXXXXX)
echo "tmp working dir: $tmp_dir"

origin_dir=$PWD
cd $tmp_dir

git clone $from --mirror
cd `ls -1`
echo "PWD:" `pwd`
git remote add new $to
git push new --mirror

cd $origin_dir
echo "Mirroing done"
echo "Cleanup tmp dir: $tmp_dir"
rm -rf $tmp_dir
