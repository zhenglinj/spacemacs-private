#!/usr/bin/env python3

import os

def Gitignore2Snippet(from_dir, to_dir, snippet_group=''):
    if (not os.path.exists(to_dir)):
        os.makedirs(to_dir)

    original_files = os.listdir(from_dir)

    for fn in original_files:
        if (not fn.endswith('.gitignore')):
            continue
        fin = open(os.path.join(from_dir, fn))
        content = fin.read()
        fin.close()
        fout = open(os.path.join(to_dir, fn), 'w')
        lang = (fn.split('.'))[0]
        content_header = "# -*- mode: snippet -*-\n"
        content_header += "# name: {0}\n".format(lang)
        content_header += "# key: {0}\n".format(lang.lower())
        content_header += "# group: " + snippet_group + "\n" if snippet_group else ""
        content_header += "# --\n"
        content_header += "##### " + lang + " #####\n"
        if (content.startswith(content_header)):
            continue
        else:
            fout.write(content_header)
            fout.write(content)
        fout.close()


if __name__ == '__main__':
    Gitignore2Snippet('gitignore', 'gitignore-mode')
    Gitignore2Snippet(os.path.join('gitignore', 'Global'),
                      os.path.join('gitignore-mode', 'Global'), 'Global')
