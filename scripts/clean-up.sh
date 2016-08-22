#!/bin/bash

# Delete Kubernetes Network Subnet
gcloud compute networks subnets delete kubernetes

# Delete Kubernetes Network
gcloud compute networks delete kubernetes
