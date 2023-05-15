#!/bin/bash
set -ex

docker build ../../app-hello-kube -t registry.local/hello-kube
docker push registry.local/hello-kube

helm install app-hello-kube .
