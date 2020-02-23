#!/bin/bash
echo 'Creating Plex Persistant Volumes'

kubectl apply -f plex-config-pv.yml

kubectl apply -f plex-media-pv.yml

sleep 1

echo 'Creating Plex Persistant Volume Claims'

kubectl apply -f plex-config-pvc.yml

kubectl apply -f plex-media-pvc.yml

sleep 1

echo 'Creating Plex Deployment'

kubectl apply -f plex-deployment.yml

sleep 1

echo 'Creating Plex NodePort Service'

kubectl apply -f plex-service-nodeport.yml

echo 'Done'

kubectl get pods