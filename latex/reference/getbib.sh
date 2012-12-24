#!/bin/bash

#Get formatted reference from ".bib" database. 

dir=`dirname $0`
#echo $dir
#exit 0 
tmp="$dir/tmp"
mkdir -p $tmp

declare -a LIB_BIB=( \ 
"$HOME/library/utility/bib-storage/*.bib"
)

rm -f $tmp/all.bib

for i in ${LIB_BIB[@]}
do
	echo $i
	# cat "$i" >> $tmp/all.bib
	# to deal with IEEEtran bib format
	# it prints out the URL field
	# So I should eliminate the information in the notes
	grep -i -v "note = {available" $i >> $tmp/all.bib
	grep "^@.*," $tmp/all.bib  | sed -e 's/@.*{//g' -e 's/,$//g' > $tmp/all.bib.key
done

#rm -f $tmp/gen_bib.tex 
#rm -f $tmp/gen_bib_body.tex
#
#cp gen_bib_body.tex $tmp/gen_bib_body.tex
#

echo "\\cite{$1}" > $tmp/gen_bib_body.tex
cat gen_bib_begin.tex $tmp/gen_bib_body.tex gen_bib_end.tex > $tmp/gen_bib.tex

cd $tmp
latex gen_bib
bibtex gen_bib
cd -

#cp -f $tmp/gen_bib.bbl .
rm -f gen_bib.bbl
##sed 's/\\end\{thebibliography\}//g' $tmp/gen_bib.bbl > gen_bib.bbl
#sed 's/\\end{thebibliography}//g' $tmp/gen_bib.bbl > gen_bib.bbl
##cat manual_bib.tex >> gen_bib.bbl
#echo '\end{thebibliography}' >> gen_bib.bbl
cat $tmp/gen_bib.bbl

