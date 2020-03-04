#!/bin/bash

# minikube should before calling the script!

eval $(minikube docker-env)

docker build -t demo-backend:latest .
kubectl apply -f kubernetes.yaml
sleep 10
url="$(minikube service demo-backend --url)"
echo "$url"
curl "$url/hello"
echo ""
kubectl apply -f kubernetes2.yaml
sleep 10
curl "$url/hello"
echo ""