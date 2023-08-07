from os import listdir

from utils import percent

def merge_files(movie):
  files = listdir(movie['name'])

  files = sorted(files, key=lambda x: int(x.split('.')[0]))

  with open(movie['name'] + '.ts', 'wb') as out:
    for i, filename in enumerate(files):
      print(percent(i, len(files)), '%', sep='')
      with open(f'{movie["name"]}/{filename}', 'rb') as f:
        out.write(f.read())
