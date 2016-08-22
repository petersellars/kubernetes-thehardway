#!/bin/bash

# Ensure we have Python 2.7 installed on the system
sudo apt-get update
sudo apt-get remove -y python3
sudo apt-get autoremove -y 

# Download and Extract Google Cloud SDK
wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-122.0.0-linux-x86_64.tar.gz
tar -xzvf google-cloud-sdk-122.0.0-linux-x86_64.tar.gz
rm google-cloud-sdk-122.0.0-linux-x86_64.tar.gz

# Run the install script
./google-cloud-sdk/install.sh --quiet

# Install Additional gcloud components
./google-cloud-sdk/bin/gcloud components install kubectl -q

# Initiliase gcloud
# gcloud init

