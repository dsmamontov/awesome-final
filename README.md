# awesome-final

Проект включает в себя контейнеризированное приложение-кравлер от Otus
```
https://github.com/express42/search_engine_crawler
https://github.com/express42/search_engine_ui
```

Было сделано:
1) Terrafrm-манифесты для gcp
2) Код приложения докеризированн. Ссылки на докерхаб:
```
https://hub.docker.com/repository/docker/mamontov/ui
https://hub.docker.com/repository/docker/mamontov/crawler
```
3) Развернут гитлаб из helm-чарта
4) Настроен мониторинг кластера k8s и метрик приложения с помощью grafana и prometheus
5) Написан helm-чарт приложения
6) Настроен CI процесс деплоя приложения

# демонстрация работы приложения

тут будет ссылка

# to terraform login
```
gcloud auth application-default login
```
# terraform create cluster
```
cd terraform
terraform init
terraform apply
gcloud container clusters get-credentials awesome-k8s-cluster --zone us-central1-c --project docker-266910
```

# helm 2 install
```
helm init
```
# monitoring install
```
kubectl create namespace monitoring
helm install --name monitoring-operators --namespace monitoring --set rbac.create=true stable/prometheus-operator -f ./monitoring/prometheus-operator-values.yaml
kubectl port-forward -n monitoring  monitoring-operators-grafana-6c6b4985bd-cf775 3000
```
# для логина в графану
```
kubectl get secret -n monitoring monitoring-operators-grafana -o jsonpath="{.data.admin-password}" |  base64 --decode ; echo
kubectl get secret -n monitoring monitoring-operators-grafana -o jsonpath="{.data.admin-user}" |  base64 --decode ; echo
```
# установка гитлаба
```
kubectl create namespace gitlab (root otusgitlab)
helm repo add gitlab https://charts.gitlab.io
cd gitlab/gitlab-omnibus
helm install --name gitlab . -f values.yaml --namespace gitlab

дёрнуть ip
kubectl get service -n nginx-ingress nginx
и прописать в хостцы
34.68.218.55 gitlab-gitlab
34.68.218.55 grafana.domain.com
```
# приложение
```
https://github.com/express42/search_engine_crawler
https://github.com/express42/search_engine_ui
```
# полезные команды
```
helm upgrade --reuse-values --namespace monitoring --set rbac.create=true -f ./monitoring monitoring-operators stable/prometheus-operator
```

# деплой приложения через helm
```
kubectl create namespace application-namespace
helm delete --purge application
helm upgrade --install --force --namespace application-namespace application application/helm
```
