# -*- coding: utf-8 -*-

from xpinyin import Pinyin
import sys
import re

p = Pinyin()

#print p.get_pinyin(u"上海")

for line in sys.stdin:
    word = line.strip()
    word = word.decode('utf-8')
    if ' ' in word:
        continue
    if '\t' in word:
        continue
    #for c in [u'(', u')', u'（', u'）']:
        #if c in word:
            #continue
    word_pinyin = p.get_pinyin(word, u' ')
    if re.match(r'^[a-z ]+$', word_pinyin):
        sys.stdout.write(('%s\t%s\t1\n' % (word, word_pinyin)).encode('utf-8'))
    else:
        continue
