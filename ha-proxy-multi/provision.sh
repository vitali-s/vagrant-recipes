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

# Install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions
sudo chmod +x /usr/local/bin/docker-compose

# Build containers
docker-compose build

# Start container
docker-compose up -d 
