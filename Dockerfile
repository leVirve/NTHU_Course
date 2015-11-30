FROM python:2.7
ENV PYTHONUNBUFFERED 1
RUN apt-get update
RUN apt-get install -y tesseract-ocr tesseract-ocr-eng netcat
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/

