#!/bin/bash
set -ex

kubectl apply -f registry-deployment.yaml
kubectl apply -f registry-service.yaml
kubectl apply -f registry-pv.yaml
kubectl apply -f registry-pvc.yaml
