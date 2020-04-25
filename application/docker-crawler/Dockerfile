FROM python:3.6.0-alpine

WORKDIR /app
COPY . /app

RUN apk --no-cache --update add build-base && \
pip install -r /app/requirements.txt && \
apk del build-base

EXPOSE 8000

ENTRYPOINT [ "python3", "crawler.py" ]
