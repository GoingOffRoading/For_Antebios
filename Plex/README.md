# Plex on Kubernetes

So...  The pattern of setting up a web accessible service with Traefik and Kubernetes:


- Setup the Persistant Volumes
- Setup the Persistant Volume Claims
- Setup the Deployment
- Setup the Service
- Setup the Ingress-Route (Traefik)

# Make it easy..

Start.sh and Stop.sh are the easy buttons for brining everything related to the Plex deployment up and down.

It probably breaks a bunch of best practices but this is for home... Whatever

## Make it hard...

Run kubectl apply -f on each of the .yml files in the same order as the start.sh file.

## When done

Assuming nothing broke, Plex should be accessible at (Your Subdomain).(Your Domain).com.

I have a love/hate relationship with LetsEncrypt so you have have HTTPS:// within 90 seconds... Or never... TBD