#!/bin/bash

echo 'Deleting Traefik Deployment'

kubectl delete deployment traefik

echo 'Done'

kubectl get deployments --all-namespaces