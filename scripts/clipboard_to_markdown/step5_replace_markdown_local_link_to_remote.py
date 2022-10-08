#! /usr/bin/env python
import os
import json
from pathlib import Path

SEARCH_PATH = str(os.getenv('SEARCH_PATH') or os.getcwd()).strip()
PATH_MAP = json.loads(open('/tmp/image-map.json').read())


def main():
    commands = []
    for local, remote in PATH_MAP.items():
        name = Path(local).name
        s = f"find . -type f -name '*.md'|xargs sed -i '/{name}/c\\{remote}'"
        commands.append(s)
    with open('/tmp/image-commands.sh', 'w') as f:
        f.write('\n'.join(commands))


if __name__ == '__main__':
    main()
