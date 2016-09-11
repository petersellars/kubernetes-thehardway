# Kubernetes - The Hard Way
Repository for code based on [Kelsey Hightower's - Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way) tutorial.

## Cloud Infrastructure Provisioning

### Google Cloud Platform

The [scripts/cloud-infra-provisioning.sh](./scripts/cloud-infra-provisioning.sh) script will stand up a H/A [Kubernetes](http://kubernetes.io) cluster on [Google Cloud Platform](https://cloud.google.com/). It creates a custom network, provides firewall rules, creates a Kubernetes public IP address and provisions a number of virtual machines.

The [scripts/clean-up.sh](./scripts/clean-up.sh) can be used to tear down the provisioned cloud infrastructure.

### AWS

## Vagrant Box
The [Vagrantfile](./Vagranfile) here will create a [Vagrant](https://www.vagrantup.com) box.

You can use the [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) plugin to install Guest Additions and run the scripts inside the container.

### Google Cloud Platform

### AWS
