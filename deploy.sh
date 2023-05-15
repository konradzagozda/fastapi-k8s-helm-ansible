#!/bin/bash
set -ex

minikube start --vm-driver=docker --insecure-registry="registry.local"

minikube addons enable ingress
kubectl apply -f ./infrastructure/ingress.yaml


bash -c 'cd ./infrastructure/registry && ./deploy-registry.sh'
sleep 10
bash -c 'cd ./infrastructure/app-hello-kube && ./deploy-app.sh'


