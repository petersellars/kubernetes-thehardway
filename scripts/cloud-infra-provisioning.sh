#!/bin/bash
gcloud compute instances list

# Create a Custom Network
gcloud compute networks create kubernetes --mode custom

# Create a subnet for the Kubernetes cluster
gcloud compute networks subnets create kubernetes \
  --network kubernetes \
  --range 10.240.0.0/24 \
  --region us-central1

# Create Firewall Rules
gcloud compute firewall-rules create kubernetes-allow-icmp \
  --allow icmp \
  --network kubernetes \
  --source-ranges 0.0.0.0/0

gcloud compute firewall-rules create kubernetes-allow-internal \
  --allow tcp:0-65535,udp:0-65535,icmp \
  --network kubernetes \
  --source-ranges 10.240.0.0/24

gcloud compute firewall-rules create kubernetes-allow-rdp \
  --allow tcp:3389 \
  --network kubernetes \
  --source-ranges 0.0.0.0/0

gcloud compute firewall-rules create kubernetes-allow-ssh \
  --allow tcp:22 \
  --network kubernetes \
  --source-ranges 0.0.0.0/0

gcloud compute firewall-rules create kubernetes-allow-healthz \
  --allow tcp:8080 \
  --network kubernetes \
  --source-ranges 130.211.0.0/22

gcloud compute firewall-rules create kubernetes-allow-api-server \
  --allow tcp:6443 \
  --network kubernetes \
  --source-ranges 0.0.0.0/0

gcloud compute firewall-rules list --filter "network=kubernetes"

# Create the Kubernetes Public IP Address
gcloud compute addresses create kubernetes --region us-central1
gcloud compute addresses list kubernetes

# Provision Virtual Machines

# etcd
gcloud compute instances create etcd0 \
 --boot-disk-size 200GB \
 --can-ip-forward \
 --image ubuntu-1604-xenial-v20160627 \
 --image-project ubuntu-os-cloud \
 --machine-type n1-standard-1 \
 --private-network-ip 10.240.0.10 \
 --subnet kubernetes \
 --zone us-central1-a

gcloud compute instances create etcd1 \
 --boot-disk-size 200GB \
 --can-ip-forward \
 --image ubuntu-1604-xenial-v20160627 \
 --image-project ubuntu-os-cloud \
 --machine-type n1-standard-1 \
 --private-network-ip 10.240.0.11 \
 --subnet kubernetes \
 --zone us-central1-a

gcloud compute instances create etcd2 \
 --boot-disk-size 200GB \
 --can-ip-forward \
 --image ubuntu-1604-xenial-v20160627 \
 --image-project ubuntu-os-cloud \
 --machine-type n1-standard-1 \
 --private-network-ip 10.240.0.12 \
 --subnet kubernetes \
 --zone us-central1-a

gcloud compute instances list

# Kubernetes Controllers
gcloud compute instances create controller0 \
  --boot-disk-size 200GB \
  --can-ip-forward \
  --image ubuntu-1604-xenial-v20160627 \
  --image-project ubuntu-os-cloud \
  --machine-type n1-standard-1 \
  --private-network-ip 10.240.0.20 \
  --subnet kubernetes \
  --zone us-central1-a

gcloud compute instances create controller1 \
  --boot-disk-size 200GB \
  --can-ip-forward \
  --image ubuntu-1604-xenial-v20160627 \
  --image-project ubuntu-os-cloud \
  --machine-type n1-standard-1 \
  --private-network-ip 10.240.0.21 \
  --subnet kubernetes \
  --zone us-central1-a

gcloud compute instances create controller2 \
  --boot-disk-size 200GB \
  --can-ip-forward \
  --image ubuntu-1604-xenial-v20160627 \
  --image-project ubuntu-os-cloud \
  --machine-type n1-standard-1 \
  --private-network-ip 10.240.0.22 \
  --subnet kubernetes \
  --zone us-central1-a

gcloud compute instances list

# Kubernetes Workers
gcloud compute instances create worker0 \
  --boot-disk-size 200GB \
  --can-ip-forward \
  --image ubuntu-1604-xenial-v20160627 \
  --image-project ubuntu-os-cloud \
  --machine-type n1-standard-1 \
  --private-network-ip 10.240.0.30 \
  --subnet kubernetes \
  --zone us-central1-a

gcloud compute instances create worker1 \
  --boot-disk-size 200GB \
  --can-ip-forward \
  --image ubuntu-1604-xenial-v20160627 \
  --image-project ubuntu-os-cloud \
  --machine-type n1-standard-1 \
  --private-network-ip 10.240.0.31 \
  --subnet kubernetes \
  --zone us-central1-a

gcloud compute instances create worker2 \
  --boot-disk-size 200GB \
  --can-ip-forward \
  --image ubuntu-1604-xenial-v20160627 \
  --image-project ubuntu-os-cloud \
  --machine-type n1-standard-1 \
  --private-network-ip 10.240.0.32 \
  --subnet kubernetes \
  --zone us-central1-a

gcloud compute instances list

