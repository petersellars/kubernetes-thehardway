#!/bin/bash

# Delete Kubernetes Network Subnet
gcloud compute networks subnets delete kubernetes --region us-central1 --quiet

# Delete Kubernetes Network
gcloud compute networks delete kubernetes --quiet
