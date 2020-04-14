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
grafana.domain.com прописать в хостцы

# для логина в графану
kubectl get secret -n monitoring monitoring-operators-grafana -o jsonpath="{.data.admin-password}" |  base64 --decode ; echo
  kubectl get secret -n monitoring monitoring-operators-grafana -o jsonpath="{.data.admin-user}" |  base64 --decode ; echo


# установка гитлаба
kubectl create namespace gitlab
helm repo add gitlab https://charts.gitlab.io
cd gitlab/gitlab-omnibus
helm install --name gitlab . -f values.yaml --namespace gitlab

дёрнуть ip
kubectl get service -n nginx-ingress nginx
и прописать в хостцы
34.71.245.151 gitlab-gitlab

план:

3) локальная установка риложения
4) установка приложения в кластере
5) настройка мониторинга
