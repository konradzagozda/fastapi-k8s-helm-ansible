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

## First deployment

```sh
cd infrastructure/playbooks
ansible-playbook deploy-all.yaml # setups local docker registry and namespaces for environments
```

app is ready here: <http://hello-default-kube.local>

## Environments

There are 4 environments to deploy to:

- default: <http://hello-default-kube.local>
- dev: <http://hello-dev-kube.local>
- uat: <http://hello-uat-kube.local>
- prod: <http://hello-prod-kube.local>

## Further deployments

```sh
cd infrastructure/playbooks
ansible-playbook deploy-app.yaml --extra-vars "env=default"
ansible-playbook deploy-app.yaml --extra-vars "env=dev"
ansible-playbook deploy-app.yaml --extra-vars "env=uat"
ansible-playbook deploy-app.yaml --extra-vars "env=prod"
```
