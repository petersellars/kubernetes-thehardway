#!/bin/bash

# Delete VPC

aws ec2 describe-vpcs \
  --filters "Name=tag:Name,Values=kubernetes" | \
  jq -r '.Vpcs[].VpcId'

VPC_ID=$(aws ec2 describe-vpcs \
  --filters "Name=tag:Name,Values=kubernetes" | \
  jq -r '.Vpcs[].VpcId')

aws ec2 delete-vpc --vpc-id ${VPC_ID}
aws ec2 describe-vpcs --filters "Name=isDefault,Values=false"

