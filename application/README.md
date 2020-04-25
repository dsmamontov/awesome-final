https://github.com/express42/search_engine_crawler
https://github.com/express42/search_engine_ui


=========

MONGO=mongo-app
MONGO_PORT=27017
RMQ_HOST=rabbit-app
RMQ_QUEUE=crawler_engine_queue
RMQ_USERNAME=user
RMQ_PASSWORD=password
CHECK_INTERVAL=10
EXCLUDE_URLS='.*github.com'

========= локальный запуск

docker run -d --rm -p 27017:27017 --name mongo-app mongo:4.2.5

docker run -d --rm --name some-rabbit -p 5672:5672 -p 15672:15672 rabbitmq:3

docker build -t mamontov/ui:v2.0 .
docker run -d --rm --name ui -p 8000:8000 -e MONGO=172.17.0.2 -e MONGO_PORT=27017 -e FLASK_APP=/ui.py ui:v2.0 gunicorn -b 0.0.0.0 mamontov/ui:app

docker build -t mamontov/crawler:v2.7 .

docker run -d --name crawler-app -p 8001:8000 -e MONGO=172.17.0.2 -e MONGO_PORT=27017 -e RMQ_HOST=172.17.0.3 -e RMQ_QUEUE=crawler_engine_queue -e RMQ_USERNAME=guest -e RMQ_PASSWORD=guest -e CHECK_INTERVAL=10 -e EXCLUDE_URLS='.*github.com' -e URL='https://vitkhab.github.io/search_engine_test_site/' mamontov/crawler:v2.7
=========

применить настрйоки kubectl apply -f . --force
