FROM python:alpine

WORKDIR /home

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY *.py ./

CMD ["python", "app.py"]
