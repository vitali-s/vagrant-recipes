#!/bin/bash

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
    curl \
    apt-transport-https \
    ca-certificates \ 
    software-properties-common \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

# Add Docker’s official GPG key:
curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -

# Set up the stable repository.
sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"

# Update packages
sudo apt-get update

# Install specific version of engine 1.13.1
sudo apt-get -y install docker-engine=1.13.1-0~ubuntu-trusty

# Use as non-root user
sudo usermod -aG docker vagrant

# Build container
docker build -t haproxy-container /vagrant/haproxy

# Run contaienr and expose ports
docker run -d --publish 8080:80 --name haproxy-instance haproxy-container 