#!/bin/bash
set -ex

docker build ../../app-hello-kube -t registry.local/hello-kube
docker push registry.local/hello-kube
kubectl apply -f app-deployment.yaml
kubectl apply -f app-service.yaml
