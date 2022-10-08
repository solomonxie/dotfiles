#! /usr/bin/env python
import os

SHA = str(os.getenv('sha') or 'N-A').strip()
BUCKET_NAME = str(os.getenv('BUCKET_NAME') or 'N-A').strip()


def main():
    l1, l2, l3 = SHA[:2], SHA[2:4], SHA[4:6]
    s3_path = f'pics/{l1}/{l2}/{l3}/{SHA}.png'
    url = f'https://{BUCKET_NAME}.s3.amazonaws.com/{s3_path}'
    markdown_url = f'![{SHA}]({url})'
    print(markdown_url)


if __name__ == '__main__':
    main()
