# awesome-final

# to terraform login

gcloud auth application-default login

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

# установка гитлаба

kubectl create namespace gitlab (root otusgitlab)
helm repo add gitlab https://charts.gitlab.io
cd gitlab/gitlab-omnibus
helm install --name gitlab . -f values.yaml --namespace gitlab

дёрнуть ip
kubectl get service -n nginx-ingress nginx
и прописать в хостцы
34.68.218.55 gitlab-gitlab
34.68.218.55 grafana.domain.com

# приложение

https://github.com/express42/search_engine_crawler
https://github.com/express42/search_engine_ui

# полезные команды
#helm upgrade --reuse-values --namespace monitoring --set rbac.create=true -f ./monitoring monitoring-operators stable/prometheus-operator
