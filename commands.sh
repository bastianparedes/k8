# inicia minikube en local docker
minikube start

# pone docker en conetxto minikube y buildea las imagenes
eval $(minikube -p minikube docker-env)
docker build -t back1:latest -f ./back1/Dockerfile ./back1
docker build -t back2:latest -f ./back2/Dockerfile ./back2

# cada uno por separado en local expone los puertos (solo uno a la vez y solo para debugeear en local)
# fijarme si el namespace está en namespace1 o default
kubectl port-forward service/back1-service 3000:80 -n namespace1
kubectl port-forward service/back2-service 3000:80 -n namespace1
kubectl port-forward service/nginx-service 8081:80 -n namespace1

# instala argocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode # contraseña


kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8081:80
