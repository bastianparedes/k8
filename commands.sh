docker build -t back1:latest -f ./back1/Dockerfile ./back1
docker build -t back2:latest -f ./back2/Dockerfile ./back2

kubectl apply -f ./deployments.yaml -f ./services.yaml
kubectl port-forward service/back1-service 3000:80 -n namespace1
kubectl port-forward service/back2-service 3000:80 -n namespace1
kubectl port-forward service/nginx-service 8081:80 -n namespace1

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl port-forward svc/argocd-server -n argocd 8080:443

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8081:80

brew install helm

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/master/manifests/install.yaml
