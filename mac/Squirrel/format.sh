#!/bin/bash
#
# Utility to import Google contacts to Squirrel
#
# Steps:
#
#    1. Download `contacts.vcf` from Google
#    2. Run ./format.sh > contact.txt to generate Rime's dict
#    3. Run rime_dict_manager -i luna_pinyin contact.txt

cat contacts.vcf | grep "^FN" | sed 's/^FN://g' | sed '/^\s*$/d' | dos2unix > tmp.name
#cat tmp.name | python pinyin.py > tmp.pinyin
#paste tmp.name tmp.pinyin | awk 'BEGIN{OFS="\t"}{print $0,1;}'
cat tmp.name | python pinyin.py

