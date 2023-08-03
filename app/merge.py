from os import listdir, system

from movies import movie
from utils import percent

files = listdir(movie['name'])

files = sorted(files, key=lambda x: int(x.split('.')[0]))

with open(movie['name'] + '.ts', 'wb') as out:
    for i, filename in enumerate(files):
        system('cls')
        print(percent(i, len(files)), '%', sep='')
        with open(f'{movie["name"]}/{filename}', 'rb') as f:
            out.write(f.read())
