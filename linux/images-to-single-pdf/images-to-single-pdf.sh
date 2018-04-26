#!/bin/bash

if [[ $# == 1 ]]; then
	input_dir=$1
else
	echo "Usage: $0 {input_dir}"
	exit 255
fi

tmp_dir="${input_dir}.tmp"
output_fn="${input_dir}.pdf"

mkdir -p $tmp_dir

for fn in `ls -1 $input_dir`
do
	echo "converting $fn to pdf"
	convert ${input_dir}/${fn} ${tmp_dir}/${fn}.pdf
done

pdftk ${tmp_dir}/* cat output $output_fn

