#!/bin/bash

# Delete Virtual Machines
gcloud compute instances delete \
  worker0 worker1 worker2 \
  controller0 controller1 controller2 \
  etcd0 etcd1 etcd2 \
  --zone us-central1-a \
  --quiet

# Delete Kubernetes Public IP Address
gcloud compute addresses delete kubernetes --region us-central1 --quiet

# Delete Firewall Rules
gcloud compute firewall-rules delete \
  kubernetes-allow-api-server \
  kubernetes-allow-healthz \
  kubernetes-allow-ssh \
  kubernetes-allow-rdp \
  kubernetes-allow-internal \
  kubernetes-allow-icmp \
  --quiet

# Delete Kubernetes Network Subnet
gcloud compute networks subnets delete kubernetes --region us-central1 --quiet

# Delete Kubernetes Network
gcloud compute networks delete kubernetes --quiet
