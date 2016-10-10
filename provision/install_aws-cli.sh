#!/bin/bash

# Install Python 2.7 and pip
sudo apt-get install python2.7 -y
curl -O https://bootstrap.pypa.io/get-pip.py
sudo python2.7 get-pip.py

# Install AWS CLI and aws-shell
sudo pip install awscli
sudo pip install aws-shell

# Install jq tool
sudo apt install jq

# Configure AWS
# aws configure
