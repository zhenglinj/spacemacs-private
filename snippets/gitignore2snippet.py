#!/usr/bin/env python3

import os
import re


def lreplace(pattern, sub, string):
    """
    Replaces 'pattern' in 'string' with 'sub' if 'pattern' starts 'string'.
    """
    return sub + string[len(pattern):] if string.startswith(pattern) else string

def rreplace(pattern, sub, string):
    """
    Replaces 'pattern' in 'string' with 'sub' if 'pattern' ends 'string'.
    """
    return string[-len(pattern):] + sub if string.endswith(pattern) else string

def Gitignore2Snippet(from_dir, to_dir, snippet_group=''):
    if (not os.path.exists(to_dir)):
        os.makedirs(to_dir)
    original_files = os.listdir(from_dir)
    for fn in original_files:
        if (not fn.endswith('.gitignore')):
            continue
        try:
            filein = os.path.join(from_dir, fn)
            print("Transform file: {0} ...".format(filein))
            with open(filein) as fin:
                content = fin.read()
                fileout = os.path.join(to_dir, fn)
                fout = open(fileout, 'w')
                lang = (fn.split('.'))[0]
                content_header = "# -*- mode: snippet -*-\n"
                content_header += "# name: {0}\n".format(lang)
                content_header += "# key: {0}\n".format(lang.lower())
                content_header += "# group: " + snippet_group + "\n" if snippet_group else ""
                content_header += "# --\n"
                content_header += "##### " + lang + " #####\n"
                ignore_headers = ["# -*- mode: gitignore; -*-\n"]
                if (content.startswith(content_header)):
                    print("Check the file already transformed")
                    fout.write(content)
                else:
                    print("Check and append the header to file")
                    fout.write(content_header)
                    for ignore_header in ignore_headers:
                        content = lreplace(ignore_header, "", content)
                    fout.write(content)
                print("Sink the content to file: {0}\n".format(fileout))
        except Exception as ex:
            print("Exception: ", ex)

if __name__ == '__main__':
    Gitignore2Snippet('gitignore', 'gitignore-mode')
    Gitignore2Snippet(os.path.join('gitignore', 'Global'),
                      os.path.join('gitignore-mode', 'Global'), 'Global')
