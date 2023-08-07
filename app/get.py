from os import mkdir
import requests

from utils import percent

def download(movie):
  q = movie.get('quality', '1080')
  url_parts = movie['url']
  url = lambda i: url_parts.format(name=movie['name'], q=q, i=i)

  mkdir(movie['name'])

  for i in range(1, movie['parts'] + 1):
    print(f'Downloading part {i} - {percent(i, movie["parts"])}%')

    with open(f'{movie["name"]}/{i}.ts', 'wb') as f:
      r = requests.get(url(i), allow_redirects=True)

      f.write(r.content)

movie = {
  'name': 'poczatok',
  'parts': 150,
  'url': 'https://s2.ashdi.vip/content/stream/films/pochatok_1219/hls/{q}/segment{i}.ts',
  # 'quality': '1080'
}

download(movie)
