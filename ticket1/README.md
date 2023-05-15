# Ticket 1

## Requirements

- docker
- minikube

## Steps

deploy registry:

```sh
./deploy-registry.sh
```

check if registry is accessible from the cluster:

```sh
kubectl get service docker-registry -o jsonpath='{.spec.clusterIP}'
minikube ssh 
curl -I http://${CLUSTER_IP}:5000
```

check if registry is accessible from local machine:

```sh
IP=$(minikube ip)
NODE_PORT=$(kubectl get service docker-registry -o jsonpath='{.spec.ports[0].nodePort}')
curl -I http://${IP}:${NODE_PORT}
```

or after adding entry to /etc/hosts:

```sh
# /etc/hosts
...
192.168.49.2    registry.local
```

you can do:

```sh
curl -I http://registry.local
```
