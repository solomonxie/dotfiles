#! /usr/bin/env python
import os
import boto3

SHA = str(os.getenv('sha') or 'N-A').strip()
BUCKET_NAME = str(os.getenv('BUCKET_NAME') or 'N-A').strip()


def s3_file_exists(s3_resource, s3_path):
    try:
        s3_resource.Object(BUCKET_NAME, s3_path).load()
        return True
    except Exception:
        pass
    return False


def main():
    s3_path = f'pics/{SHA}.png'
    s3_resource = boto3.resource('s3')
    if not s3_file_exists(s3_resource, s3_path):
        s3_resource.meta.client.upload_file(f'/tmp/{SHA}.png', BUCKET_NAME, s3_path)
    # FIXME: INSTEAD, UPLOAD TO A PRIVATE BUCKET, BUT OPEN FILE PUBLIC-READ PERMISSION
    # object_acl = s3_resource.ObjectAcl(BUCKET_NAME, s3_path)
    # object_acl.put(ACL='public-read')

    print(f'uploaded pic to: https://{BUCKET_NAME}.s3.amazonaws.com/{s3_path}')


if __name__ == '__main__':
    main()
