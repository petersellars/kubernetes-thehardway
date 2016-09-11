# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  # General Vagrant VM configuration 
  config.vm.box = "ubuntu/xenial64"

  config.vm.synced_folder "./scripts", "/scripts"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :virtualbox do |v|
    v.memory = 256
  end 

  # Google Cloud Provisioned Cluster
  config.vm.define "default" do |gcp|
    gcp.vm.hostname = "gcp.kubernetes"
    gcp.vm.provider :virtualbox do |v|
      v.name = "Kubernetes GCP"
    end
    gcp.vm.provision "install-gcloudsdk",
      type: :shell,
      path: "provision/install_gcloudsdk.sh",
      privileged: false
  end

  # AWS Provisioned Cluster 
  config.vm.define "aws" do |aws|
    aws.vm.hostname = "aws-kubernetes"
    aws.vm.provider :virtualbox do |v|
      v.name = "Kubernetes AWS"
    end
    aws.vm.provision "install-aws-cli",
      type: :shell,
      path: "provision/install_aws-cli.sh",
      privileged: false
  end

end
