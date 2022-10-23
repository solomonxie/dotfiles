#! /usr/bin/env python
import os
import hashlib
# from PIL import Image
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
    image = ImageGrab.grabclipboard()
    if image:
        # # Resize
        # width, height = image.size
        # if width > 1024 or height > 768:
        #     image.thumbnail((1024, 768), Image.ANTIALIAS)
        # # Save
        # image.save(tmp_path, 'PNG', optimize=True, quality=90)
        image.save(tmp_path, 'PNG', optimize=True)
    if not os.path.exists(tmp_path):
        raise RuntimeError(f'File not found: {tmp_path}')
    sha = file_to_sha(tmp_path)
    local_path = f'/tmp/{sha}.png'
    assert 0 == os.system(f'cp {tmp_path} {local_path}')
    print(sha)


if __name__ == '__main__':
    main()
