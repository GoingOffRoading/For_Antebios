# Kubernetes

This is my terrible documentation on my home Kuberentes cluster

Run Ubunutu on your machines.  Latest version is fine.  Debian likely works but I'm not sure on exactly how commands change from Debian to Ubuntu.

# Node Setup

## On all machines:

Give no-password sudo:

    visudo

In the '# user' section, add:

    $USERNAME$ ALL=(ALL) NOPASSWD: ALL

Install SSH:

    sudo apt install openssh-server
    sudo systemctl status ssh
    sudo systemctl enable ssh
    sudo systemctl start ssh

At this point, you can now comftorably work over SSH

## Install Docker

Documentation also found at: https://docs.docker.com/install/linux/docker-ce/ubuntu/
 
Update the apt package index:

    sudo apt-get update

Uninstall any old packages:

    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

Add Docker’s official GPG key:

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

Add the stable Docker registry:

    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

Update the apt package index:

    sudo apt-get update

Install the latest version of Docker:

    sudo apt-get install docker-ce docker-ce-cli containerd.io

Test Docker:

    sudo docker run hello-world

Enable Docker:

    sudo systemctl enable docker

## Install Kubernetes

Add the Kubernetes signing key:

    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

Add the Xenial Kubernetes Repository:

    sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

Install Kubeadm:

    sudo apt install kubeadm

Valdiate Kibeadm install:

    kubeadm version

Disable Swap:

    sudo swapoff -a

Be sure to comment out swap from fstab:

    sudo nano /etc/fstab

## Start the Master Node

Initiaite Kuberentes on the master node:

    sudo kubeadm init --pod-network-cidr=10.244.0.0/16

When complete, run:

    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config

Copy the join token to a nodepad.

Add Weave Net:

    kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

Check node status:

    kubectl get nodes

## Add worker nodes

Use join token on worker nodes.

## Done

Run:

    kubectl get nodes

If everything reads as ready, proceed to the Traefik directory