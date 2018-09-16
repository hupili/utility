#!/usr/bin/env bash

git submodule init
git submodule update

if [[ `uname -s` == "Darwin" ]] ; then
	_mac=1
	_unix=1
fi
if [[ `uname -s` == "Linux" ]] ; then
	_linux=1
fi

echo "Deploy on system:"
echo _mac $_mac
echo _unix $_unix
echo _linux $_linux

function install(){
	test $_mac && src=`greadlink -f $1`
	test $_linux && src=`readlink -f $1`
	dst=$2
	if [[ -e "$dst" ]] ; then
		test $_mac && dst_link=`greadlink -f $dst`
		test $_linux && dst_link=`readlink -f $dst`
		if [[ "$src" == "$dst_link" ]] ; then
			echo "	[INFO] Already installed"
		else
			echo "	[WARNING] Conflict: destination already exists!"
		fi
	else
		echo "	[INFO] Linking to destination..."
		# In case the previous link is broken, remove it
		rm -f $dst
		dir_dst=`dirname $dst`
		mkdir -p $dir_dst
		test $_mac && gln -s $src $dst
		test $_linux && ln -s $src $dst
	fi
}

for recipe in `find . -name recipe`
do
	echo 
	echo "Find recipe '$recipe'"
	dir_recipe=`pwd`/`dirname $recipe`
	for rule in `cat $recipe`
	do
		echo 
		echo "Execute rule '$rule'"
		src=`echo "$rule" | sed 's/-->/	/g' | cut -f1`
		src=$dir_recipe/`eval "echo $src"`
		echo "	source: $src"
		dst=`echo "$rule" | sed 's/-->/	/g' | cut -f2`
		dst=`eval "echo $dst"`
		echo "	destination: $dst"
		install $src $dst
	done
done

