import os

import boto3

from get import download
from merge import merge_files

movie = {
  'name': 'poczatok',
  'parts': 150,
  'url': 'https://s2.ashdi.vip/content/stream/films/pochatok_1219/hls/{q}/segment{i}.ts',
  # 'quality': '1080'
}

for k, v in os.environ.items():
  print(f'{k}: {v}')

def main():
  s3 = boto3.resource('s3')
  download(movie)
  merge_files(movie)

  filename = f'{movie["name"]}.ts'

  s3.Bucket(os.getenv('S3_OUTPUT')).upload_file(filename, filename)

# if __name__ == '__main__':
#   main()
