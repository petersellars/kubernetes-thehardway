#!/bin/bash

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
