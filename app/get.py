from os import mkdir
import requests

from utils import percent

def download(movie):
  q = movie.get('quality', '1080')
  url_parts = movie['url']
  url = lambda i: url_parts.format(q=q, i=i)

  mkdir('movie')

  for i in range(1, movie['parts'] + 1):
    print(f'Downloading part {i} - {percent(i, movie["parts"])}%')
    print(url(i))

    with open(f'movie/{i}.ts', 'wb') as f:
      r = requests.get(url(i), allow_redirects=True)

      f.write(r.content)
