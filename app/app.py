import os
import json
from base64 import b64decode

import boto3

from get import download
from merge import merge_files

movie = os.getenv('UAKINO_PARAMS')
movie = b64decode(movie).decode('utf-8')
movie = json.loads(movie)

print(movie)

download(movie)
merge_files(movie)

filename = f'{movie["name"]}.ts'

s3 = boto3.resource('s3')
s3.Bucket(os.getenv('S3_OUTPUT')).upload_file('movie.ts', filename)
