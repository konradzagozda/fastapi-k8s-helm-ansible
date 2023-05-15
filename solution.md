# Solution

## Requirements

- docker
- minikube
- kubectl
- helm
- ansible

## Setup

tell docker to trust the registry:

```sh
# /etc/docker/daemon.json (local machine)
{
  "insecure-registries" : ["registry.local"]
}
```

configure local dns

```sh
# /etc/hosts
...
192.168.49.2    registry.local  # 192.168.49.2 get it from 'minikube ip'
192.168.49.2    hello-default-kube.local
192.168.49.2    hello-dev-kube.local
192.168.49.2    hello-uat-kube.local
192.168.49.2    hello-prod-kube.local
```

start the cluster:

```sh
./deploy.sh
```

## Ticket 1

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

or after adding entry to `/etc/hosts` you can do:

```sh
curl -I http://registry.local
```

## Ticket 2

application is deployed here:

```sh
curl http://hello-kube.local/
```

## Ticket 3

updated `app-hello-kube` to use helm chart from raw kubernetes objects

## Ticket 4

There are 2 main deploy playbooks:

- `ansible-playbook deploy-all.yaml` - deploy with cluster setup, registry and app
- `ansible-playbook deploy-app.yaml` - deploy app only

Choosing namespace and environment:

```sh
cd infrastructure/playbooks
ansible-playbook deploy-all.yaml  # env=default
ansible-playbook deploy-all.yaml --extra-vars "env=dev"
```

app will be available at <http://hello-{{env}}-kube.local/>
e.g <http://hello-dev-kube.local/> or <http://hello-default-kube.local/>

You can have multiple apps deployed at the same time
