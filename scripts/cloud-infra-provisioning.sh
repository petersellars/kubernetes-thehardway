#!/bin/bash
gcloud compute instances list

# Create a Custom Network
gcloud compute networks create kubernetes --mode custom

# Create a subnet for the Kubernetes cluster
gcloud compute networks subnets create kubernetes \
  --network kubernetes \
  --range 10.240.0.0/24 \
  --region us-central1
