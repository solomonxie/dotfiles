#!/usr/bin/env python

import os
import re
import sys


def find_replace(fname):
    print('[..]', fname)
    lines = []
    path = os.path.realpath(fname)
    # ptn = re.compile('<img.+src="([^"]+)".*>')
    with open(path, 'r') as f:
        for s in f.readlines():
            if '<img' in s and 'src="' in s and '>' in s:
                result = re.compile('src="([^"]+)"').findall(s)
                img_path = result[0]
                img_name = os.path.basename(img_path)
                new = f'![{img_name}]({img_path})\n'
                print('\t-', s)
                print('\t+', new)
                lines.append(new)
            elif '![[' in s and ']]' in s:
                result = re.compile('\!\[\[(.+)\]\]').findall(s)  # NOQA: W605
                img_path = result[0]
                img_name = os.path.basename(img_path)
                new = f'![{img_name}]({img_path})\n'
                print('\t-', s)
                print('\t+', new)
                lines.append(new)
            elif '![' in s and ']' in s and '.png)' in s:
                result = re.compile('!\[.+\]\((.+)\)').findall(s)  # NOQA: W605
                img_path = result[0]
                img_name = os.path.basename(img_path)
                new = f'![{img_name}]({img_path})\n'
                print('\t-', s)
                print('\t+', new)
                lines.append(new)
            else:
                lines.append(s)
    if lines:
        with open(path, 'w') as f:
            f.write(''.join(lines))
        print('[ OK ]', fname)


if __name__ == '__main__':
    for fname in sys.argv[1:]:
        find_replace(fname)
