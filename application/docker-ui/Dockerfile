FROM alpine:3.11.5

RUN apk add --no-cache git python3 busybox

COPY . ./
RUN pip3 install -r requirements.txt
RUN chmod +x ./ui.py

EXPOSE 8000

ENTRYPOINT []
