#!/usr/bin/env bash

git submodule init
git submodule update

function install(){
	src=`greadlink -f $1`
	dst=$2
	if [[ -e "$dst" ]] ; then
		dst_link=`greadlink -f $dst`
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
		gln -s $src $dst
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

