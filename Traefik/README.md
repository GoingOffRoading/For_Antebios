# Traefik

This took a lot of trial and error but is based on the v2.0 Traefik Lets Encrypt user guide: https://docs.traefik.io/user-guides/crd-acme/

# Resource Groups

Traefik 2.0 defines a variety of new resource types that allows Traefik to get creating in what gets routed.

The Resource file here is the same as what is in the 2.0 guide as of February 23rd, 2020: https://docs.traefik.io/user-guides/crd-acme/#ingressroute-definition

Assuming you git-cloned this repo into your control node:

    kubectl apply -f traefik-resources.yaml

# Deployment

To stand Traefik up, run:

    kubectl apply -f traefik-deployment.yaml

This will do a few things... 
- Deploy some tretiatry things
- Deploy the deployment to a pod
- Start a nodePort service

Once complete, Traefik should be avaliable at (IP of any of your Kubernetes nodes):30002 for the Admin UI, 30000 for port 80 traffic, 30001 for port 443 traffic.

If you wanted to start to use your reverse-proxy, you would setup port forwading in your router to the IP of one of the Kubernetes nodes and map port 80 incoming to port 30000 and port 443 to port 30001

# RedirectSceme

This is not well documented and is missing from the Traefik guides.  To redirect port 80 traffic to port 443 so that all traffic lands on https:// (instead of the insecure http://), you need to deploy a RedirectSceme:

    kubectl apply -f traefik-RedirectScheme.yaml
