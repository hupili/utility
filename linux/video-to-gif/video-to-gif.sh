#!/bin/bash
# Adapted from;
# http://minimaxir.com/2015/08/gif-to-video-osx/

if [[ $# == 1 ]]; then
	fn_input=$1
else
	echo "Usage: $0 {fn_input}"
	exit 255
fi

full_filename=$(basename "$fn_input")
dirname=$(dirname "$fn_input")
extension="${full_filename##*.}"
filename="${full_filename%.*}"
fn_output=$dirname/${filename}.gif

#echo $full_filename
#echo $dirname
#echo $extension
#echo $filename
#echo $fn_output

mplayer -ao null -vo png:z=1:outdir=gif -vf scale -zoom -xy 600 $fn_input
convert +repage -fuzz 1.6% -delay 1.7 -loop 0 gif/*.png -layers OptimizePlus -layers OptimizeTransparency tmp.gif
gifsicle -O3 --colors 256 tmp.gif > $fn_output

rm tmp.gif
rm -rf gif
