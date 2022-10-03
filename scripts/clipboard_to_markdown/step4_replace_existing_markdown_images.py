#! /usr/bin/env python
import os
import json
import boto3
import hashlib
from pathlib import Path

S3 = boto3.resource('s3')
BUCKET_NAME = str(os.getenv('BUCKET_NAME') or 'N-A').strip()
SEARCH_PATH = str(os.getenv('SEARCH_PATH') or '/tmp').strip()
PATH_MAP = {}


def file_to_sha(path: str) -> str:
    path = os.path.realpath(os.path.expanduser(path))
    with open(path, 'rb') as f:
        raw = f.read()
    sha = hashlib.md5(raw).hexdigest()
    return sha


def s3_file_exists(s3_path):
    try:
        S3.Object(BUCKET_NAME, s3_path).load()
        return True
    except Exception:
        pass
    return False


def convert(path: str):
    __import__('pudb').set_trace()
    sha = file_to_sha(path)
    s3_path = f'pics/{sha}.png'
    if not s3_file_exists(s3_path):
        S3.meta.client.upload_file(path, BUCKET_NAME, s3_path)
    markdown_url = f'https://{BUCKET_NAME}.s3.amazonaws.com/{s3_path}'
    PATH_MAP[path] = markdown_url
    print(f'uploaded to: {markdown_url}')


def main():
    paths = [str(s) for s in Path(SEARCH_PATH).rglob('*.png')]
    for s in paths:
        convert(s.strip())
    open('/tmp/image-map.json', 'w').write(json.dumps(PATH_MAP))


if __name__ == '__main__':
    main()
