FROM alpine:3.11.5

RUN apk add --no-cache git python3 py-pip busybox

COPY . ./
RUN pip3 install -r requirements.txt
RUN chmod +x ./ui.py

EXPOSE 8000

ENTRYPOINT []

#ENTRYPOINT ["python3 search_engine_crawler/crawler/crawler.py"]
