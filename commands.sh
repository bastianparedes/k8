docker build -t back1:latest -f ./back1/Dockerfile ./back1
docker build -t back2:latest -f ./back2/Dockerfile ./back2

kubectl apply -f ./deployments.yaml -f ./services.yaml
kubectl port-forward service/back1-service 3000:80 -n namespace1

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl port-forward svc/argocd-server -n argocd 8080:443
