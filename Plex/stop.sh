#!/bin/bash

echo 'Deleting Plex NodePort Service'

kubectl delete service plex

echo 'Deleting Plex Deployment'

kubectl delete deployment plex

echo 'Deleting Plex Persistant Volume Claims'

kubectl delete pvc nfs-plex-config

kubectl delete pvc nfs-plex-media

echo 'Deleting Plex Persistant Volumes'

kubectl delete pv nfs-plex-config

kubectl delete pv nfs-plex-media

echo 'Done'

kubectl get pods