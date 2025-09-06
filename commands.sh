# inicia minikube en local docker
minikube start

# pone docker en conetxto minikube y buildea las imagenes
eval $(minikube -p minikube docker-env)
docker build -t back-1:1.0.0 -f ./back-1/Dockerfile ./back-1
docker build -t back-2:1.0.0 -f ./back-2/Dockerfile ./back-2

# cada uno por separado en local expone los puertos (solo uno a la vez y solo para debugeear en local)
# fijarme si el namespace está en namespace1 o default
kubectl port-forward service/back-1-service 3000:80 -n default
kubectl port-forward service/back-2-service 3000:80 -n default
kubectl port-forward service/nginx-service 8081:80 -n default

# instala argocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode # contraseña


kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8081:80

# para poder crear y apuntar al ingress
minikube addons enable ingress
minikube tunnel
curl --resolve "kubernetes.local:80:127.0.0.1" -i http://kubernetes.local
curl --resolve "kubernetes.local:80:127.0.0.1" -i http://kubernetes.local/common
