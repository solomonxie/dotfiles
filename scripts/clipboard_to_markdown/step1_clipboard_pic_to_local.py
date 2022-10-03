#! /usr/bin/env python
import os
import hashlib
from PIL import ImageGrab


def file_to_sha(path: str) -> str:
    path = os.path.realpath(os.path.expanduser(path))
    with open(path, 'rb') as f:
        raw = f.read()
    sha = hashlib.md5(raw).hexdigest()
    return sha


def main():
    # Clipboard -> Local
    tmp_path = '/tmp/tmp_clipboard_pic.png'
    im = ImageGrab.grabclipboard()
    if im:
        im.save(tmp_path, 'PNG')
    sha = file_to_sha(tmp_path)
    local_path = f'/tmp/{sha}.png'
    assert 0 == os.system(f'cp {tmp_path} {local_path}')
    print(sha)


if __name__ == '__main__':
    main()
