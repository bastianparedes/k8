kubectl apply -f ./deployment.yaml
kubectl port-forward service/experiments-service 3000:80
