#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Convert representation text of author string to BibTex standard author field
#
# Test: python -m doctest tex-bib-author.py -v

import sys

def author_presentation2bibtex(text_presentation):
    '''
    :param text_presentation:
        The presentation text of your author string in unicode

    >>> author_presentation2bibtex(u'Pili Hu')
    u'Hu, Pili'
    >>> author_presentation2bibtex(u'Pili Hu, Pili2 Hu, and Pili3 Hu')
    u'Hu, Pili and Hu, Pili2 and Hu, Pili3'
    >>> author_presentation2bibtex(u'Pili Hu, Pili2 Hu and Pili3 Hu')
    u'Hu, Pili and Hu, Pili2 and Hu, Pili3'
    >>> author_presentation2bibtex(u'Sushant Jain, Alok Kumar, Subhasree Mandal, Joon Ong, Leon Poutievski, Arjun Singh, Subbaiah Venkata, Jim Wanderer, Junlan Zhou, Min Zhu, Jonathan Zolla, Urs H\xc3\xb6lzle, Stephen Stuart, and Amin Vahdat')
    u'Jain, Sushant and Kumar, Alok and Mandal, Subhasree and Ong, Joon and Poutievski, Leon and Singh, Arjun and Venkata, Subbaiah and Wanderer, Jim and Zhou, Junlan and Zhu, Min and Zolla, Jonathan and H\\xc3\\xb6lzle, Urs and Stuart, Stephen and Vahdat, Amin'
    '''
    #print text_presentation
    authors = text_presentation.replace(u' and ', u',').split(u',')
    #print authors
    authors = filter(lambda a: a != u'', map(unicode.strip, authors))
    #print authors
    authors_reversed = map(lambda a: a.split()[-1] + u', ' + u' '.join(a.split()[0:-1]), authors)
    #print authors_reversed
    return unicode(u' and '.join(authors_reversed))

if __name__ == '__main__':
    if len(sys.argv) == 2:
        try:
            u_text = sys.argv[1].decode(sys.stdin.encoding)
        except:
            try:
                u_text = sys.argv[1].decode(sys.getdefaultencoding())
            except:
                try:
                    u_text = sys.argv[1].decode('utf-8')
                except:
                    print 'I have no way to decode your input'
        print author_presentation2bibtex(u_text)
    else:
        print 'usage: {0} "the author string presentation"'.format(sys.argv[0])


