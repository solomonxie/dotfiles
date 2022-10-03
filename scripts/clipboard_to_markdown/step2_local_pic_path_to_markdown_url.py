#! /usr/bin/env python
import os

SHA = str(os.getenv('sha') or 'N-A').strip()
BUCKET_NAME = str(os.getenv('BUCKET_NAME') or 'N-A').strip()


def main():
    url = f'https://{BUCKET_NAME}.s3.amazonaws.com/pics/{SHA}.png'
    markdown_url = f'![{SHA}]({url})'
    print(markdown_url)


if __name__ == '__main__':
    main()
