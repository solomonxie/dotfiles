#! /usr/bin/env python
import os
import json
import boto3
import hashlib
from PIL import Image
from pathlib import Path

S3 = boto3.resource('s3')
BUCKET_NAME = str(os.getenv('BUCKET_NAME') or 'N-A').strip()
SEARCH_PATH = str(os.getenv('SEARCH_PATH') or os.getcwd()).strip()
PATH_MAP = json.loads(open('/tmp/image-map.json').read())


def resize_image(path):
    image = Image.open(path)
    width, height = image.size
    if width > 1024 or height > 768:
        image.thumbnail((1024, 768))
        path = path.replace('.png', '_resized.png')
    # Save
    image.save(path, 'PNG', optimize=True, quality=90)
    return path


def convert(path: str):
    new_path = resize_image(path)
    sha = file_to_sha(new_path)
    l1, l2, l3 = sha[:2], sha[2:4], sha[4:6]
    s3_path = f'pics/{l1}/{l2}/{l3}/{sha}.png'
    bucket = S3.Bucket(BUCKET_NAME)
    if not list(bucket.objects.filter(Prefix=s3_path)):
        print('\tUPLOADING...')
        data = open(new_path, 'rb').read()
        bucket.put_object(Key=s3_path, Body=data, ContentType='image/png')
    s3_url = f'https://{BUCKET_NAME}.s3.amazonaws.com/{s3_path}'
    markdown_url = f'![{sha}]({s3_url})'
    PATH_MAP[path] = markdown_url
    print(f'From:\n\t{path}\nTo:\n\t{s3_url}')


def file_to_sha(path: str) -> str:
    path = os.path.realpath(os.path.expanduser(path))
    with open(path, 'rb') as f:
        raw = f.read()
    sha = hashlib.md5(raw).hexdigest()
    return sha


def main():
    paths = [str(s) for s in Path(SEARCH_PATH).rglob('*.png')]
    for i, s in enumerate(paths):
        print('='*20, f'{i}/{len(paths)}', '='*20)
        try:
            convert(s.strip())
        except Exception as e:
            print(e)
        finally:
            open('/tmp/image-map.json', 'w').write(json.dumps(PATH_MAP, indent=4))


if __name__ == '__main__':
    main()
