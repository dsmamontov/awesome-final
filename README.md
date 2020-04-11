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

# helm 2 install
helm init

# monitoring install
kubectl create namespace monitoring
helm install --name monitoring-operators --namespace monitoring --set rbac.create=true stable/prometheus-operator -f ./monitoring/prometheus-operator-values.yaml

kubectl port-forward -n monitoring  monitoring-operators-grafana-6c6b4985bd-cf775 3000

# для логина в графану
kubectl get secret -n monitoring monitoring-operators-grafana -o jsonpath="{.data.admin-password}" |  base64 --decode ; echo
kubectl get secret -n monitoring monitoring-operators-grafana -o jsonpath="{.data.admin-user}" |  base64 --decode ; echo

план:

1) конфигурация кластера k8s через terraform
2) устновка гита и ci
3) локальная установка риложения
4) установка приложения в кластере
5) настройка мониторинга
