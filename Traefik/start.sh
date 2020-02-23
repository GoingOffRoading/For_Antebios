#!/bin/bash

echo 'Creating Traefik v2.1 Deployment'

kubectl apply -f traefik-deployment.yaml

echo 'Done'

kubectl get pods