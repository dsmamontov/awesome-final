# awesome-final

# to terraform login
gcloud auth application-default login

# application demo

https://github.com/microservices-demo/microservices-demo


# terraform create cluster
cd terraform
terraform init
terraform apply
gcloud container clusters get-credentials awesome-k8s-cluster --zone us-central1-c --project docker-266910

# monitoring install
https://habr.com/ru/company/flant/blog/340728/

план:

1) конфигурация кластера k8s через terraform
2) устновка гита и ci
3) локальная установка риложения
4) установка приложения в кластере
5) настройка мониторинга
