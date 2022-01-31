#! /usr/bin/env python

import sys
import gzip
import json
import yaml
import pandas as pd


def main():
    if len(sys.argv) < 2:
        raise RuntimeError('PLEASE SPECIFY FILE PATH')
    path = sys.argv[1]
    print(f'LOADING FILE... {path}')
    if path.endswith('.json'):
        data = read_json(path)
    elif path.endswith('.json.gz'):
        data = read_json_gz(path)
    elif path.endswith('.yaml') or path.endswith('.yml'):
        data = read_yaml(path)
    elif path.endswith('.yaml.gz') or path.endswith('.yml.gz'):
        data = read_yaml_gz(path)
    elif path.endswith('.csv') or path.endswith('.csv.gz'):
        data = read_csv(path)
    else:
        raise RuntimeError(f'UNSUPPORTED FILE TYPE: {path}')
    print(len(data))
    __import__('ipdb').set_trace()
    print('OK.')


def read_json(path):
    with open(path) as f:
        data = json.loads(f.read())
    return data


def read_json_gz(path):
    with open(path) as f:
        data = json.loads(gzip.decompress(f.read()))
    return data


def read_csv(path):
    return pd.read_csv(path)


def read_yaml(path):
    with open(path) as f:
        data = yaml.safe_load(f.read())
    return data


def read_yaml_gz(path):
    with open(path) as f:
        data = yaml.safe_load(f.read())
        data = yaml.safe_load(gzip.decompress(f.read()))
    return data


if __name__ == '__main__':
    main()
