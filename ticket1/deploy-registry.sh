#!/bin/bash
set -ex

minikube start
minikube addons enable ingress
kubectl apply -f registry-deployment.yaml
kubectl apply -f registry-service.yaml
kubectl apply -f registry-pv.yaml
kubectl apply -f registry-pvc.yaml
kubectl apply -f registry-ingress.yaml
