#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Scan tex source files to detect any broken cross references
#

"""
Usage:
    tex-ref-scan.py <tex_files>...

Options:
    -h --help     Show this screen.
"""


import sys
import re

def gen_text_content_from_files(tex_files):
    for fn in tex_files:
        with open(fn) as fp:
            for l in fp.readlines():
                yield l

def gen_non_comment_text_content(text_content):
    for l in text_content:
        l = re.sub(r'%.*$', r'', l).strip()
        yield l

def search_and_return_group1_for_all(pattern, string):
    results = set()
    while True:
        r = pattern.search(string)
        if r:
            results.add(r.group(1).strip())
            string = string[r.end() + 1:]
        else:
            break
    return results

def parse_ref_label(text_content):
    PT_LABEL = re.compile(r'\\label\{(.*?)\}')
    PT_REF = re.compile(r'\\ref\{(.*?)\}')
    labels = set()
    refs = set()
    for l in text_content:
        labels |= search_and_return_group1_for_all(PT_LABEL, l)
        refs |= search_and_return_group1_for_all(PT_REF, l)
    return refs, labels


if __name__ == '__main__':
    from docopt import docopt
    arguments = docopt(__doc__)
    #print arguments
    #sys.exit(-1)
    tex_files = arguments['<tex_files>']
    text_content = gen_text_content_from_files(tex_files)
    text_content = gen_non_comment_text_content(text_content)
    refs, labels = parse_ref_label(text_content)
    print '# of refs:', len(refs)
    print '# of labels:', len(labels)
    print '--- refed but not labelled: ---'
    print refs - labels
    print '--- labelled but not refed: ---'
    print labels - refs


