from sys import argv
from os import mkdir, system
import requests

from movies import movie
from utils import percent

try:
    startfrom = int(argv[2])
except:
    startfrom = 1

default_url = 'https://nerklq.cyou/content/stream/films/{name}/hls/{q}/segment{i}.ts'

# download the movie
q = movie.get('quality', '1080')
url_parts = movie.get('url', default_url)

url = lambda i: url_parts.format(name=movie.get("filename"), q=q, i=i)

try:
    mkdir(movie['name'])
except:
    yn = input('Old files exists, are u sure u want proceed? (y/n)')
    if yn != 'y':
        exit()

for i in range(startfrom, movie['parts'] + 1):
    system('cls')
    print(f'Downloading part {i} - {percent(i, movie["parts"])}%')

    with open(f'{movie["name"]}/{i}.ts', 'wb') as f:
        r = requests.get(url(i), allow_redirects=True)

        f.write(r.content)