https://github.com/express42/search_engine_crawler
https://github.com/express42/search_engine_ui

docker build -t crawler:v1 .

=========

MONGO=mongo-app
MONGO_PORT=27017
RMQ_HOST=rabbit-app
RMQ_QUEUE=crawler_engine_queue
RMQ_USERNAME=user
RMQ_PASSWORD=password
CHECK_INTERVAL=10
EXCLUDE_URLS='.*github.com'

=========

docker pull mongo:4.2.5
30ad84e2aca2

docker run -it --rm --name rabbit-app -e RABBITMQ_DEFAULT_USER=user -e RABBITMQ_DEFAULT_PASS=password rabbitmq:3-management

docker build -t crawler:v1 .

docker run -it --rm --name crawler-app -e MONGO=mongo-app -e MONGO_PORT=27017 -e RMQ_HOST=rabbit-app -e RMQ_QUEUE=crawler_engine_queue -e RMQ_USERNAME=user -e RMQ_PASSWORD=password -e CHECK_INTERVAL=10 -e EXCLUDE_URLS='.*github.com' crawler:v1  https://vitkhab.github.io/search_engine_test_site/


docker run -it --rm --name crawler-app crawler:v1  https://vitkhab.github.io/search_engine_test_site/

docker run -it --rm --name ui -p 8000:8000 -e MONGO=172.17.0.2 -e MONGO_PORT=27017 -e FLASK_APP=/ui.py ui:v1 gunicorn -b 0.0.0.0 ui:app

docker run -it --rm -p 27017:27017 --name mongo-app mongo:4.2.5

docker run -d --hostname my-rabbit --name some-rabbit -e RABBITMQ_DEFAULT_USER=user -e RABBITMQ_DEFAULT_PASS=password rabbitmq:3.8.3
