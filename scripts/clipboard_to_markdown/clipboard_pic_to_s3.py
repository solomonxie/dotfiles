#! /usr/bin/env python
"""
$ pip install Pillow
$ pip install boto3
"""
import os
import uuid
import boto3
import hashlib
from PIL import ImageGrab


BUCKET = os.getenv('BUCKET_NAME') or 'N-A'
assert bool(os.getenv('BUCKET_NAME'))
assert bool(os.getenv('AWS_ACCESS_KEY_ID'))
assert bool(os.getenv('AWS_SECRET_ACCESS_KEY'))


def file_to_sha(path: str) -> str:
    path = os.path.realpath(os.path.expanduser(path))
    with open(path, 'rb') as f:
        raw = f.read()
    sha = hashlib.md5(raw).hexdigest()
    return sha


def main():
    # Clipboard -> Local
    tmp_path = f'/tmp/tmp_clipboard_pic_{uuid.uuid4()}.png'
    im = ImageGrab.grabclipboard()
    if im:
        im.save(tmp_path, 'PNG')
    sha = file_to_sha(tmp_path)
    fname = f'{sha}.png'
    local_path = f'/tmp/{fname}'
    assert 0 == os.system(f'cp {tmp_path} {local_path}')

    # Local -> S3
    s3_path = f'pics/{fname}'
    # s3_key = f's3://bucketname/{s3_path}'
    client = boto3.client('s3')
    if not client.list_objects_v2(Bucket=BUCKET, Prefix=s3_path)['KeyCount']:
        client.upload_file(local_path, BUCKET, s3_path)
        # print(f'uploaded to s3: {s3_key}')
    # S3 -> URL
    url = f'https://{BUCKET}.s3.amazonaws.com/{s3_path}'
    markdown_url = f'![{sha}]({url})'
    print(markdown_url)
    return markdown_url


if __name__ == '__main__':
    main()
