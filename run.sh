#!/bin/bash

# minikube should before calling the script!

function build_image() {
  echo "Building the spring app into docker"
  docker build -t demo-backend .
}

function apply_template() {
    echo "Applying for $1"
    template=$(cat kubernetes.yaml)
    echo "${template//NAME/$1}" | kubectl apply -f -
    kubectl describe configmaps
}

function print_container_logs() {
  for id in $(docker ps -aqf "name=demo-backend")
  do
    docker logs -f "$id"
  done
}

eval "$(minikube docker-env)"
build_image
apply_template "john"
sleep 30
apply_template "mike"
print_container_logs