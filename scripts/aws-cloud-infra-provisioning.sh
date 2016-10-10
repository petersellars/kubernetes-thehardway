#!/bin/bash

# VPC (Virtual Private Cloud)

aws ec2 describe-vpcs --filters "Name=isDefault,Values=false"

VPC_ID=$(aws ec2 create-vpc \
  --cidr-block 10.240.0.0/16 | \
  jq -r '.Vpc.VpcId')
echo $VPC_ID

aws ec2 create-tags \
  --resources ${VPC_ID} \
  --tags Key=Name,Value=kubernetes

aws ec2 modify-vpc-attribute \
  --vpc-id ${VPC_ID} \
  --enable-dns-support '{"Value": true}'

aws ec2 modify-vpc-attribute \
  --vpc-id ${VPC_ID} \
  --enable-dns-hostnames '{"Value": true}'

aws ec2 describe-vpcs --filters "Name=tag:Name,Values=kubernetes"
aws ec2 describe-vpc-attribute --vpc-id ${VPC_ID} --attribute enableDnsSupport
aws ec2 describe-vpc-attribute --vpc-id ${VPC_ID} --attribute enableDnsHostnames
aws ec2 describe-vpcs --filters "Name=tag:Name,Values=kubernetes" | jq -r '.Vpcs[].VpcId'
