#!/bin/bash

# (-e) Exit immediately if a pipeline returns a non-zero status
# (-u) Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error 
set -eu

cat << EOF
############################################################
##################### PROVISION DOCKER #####################
############################################################
EOF

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

# Add Docker’s official GPG key:
curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -

# Set up the stable repository
sudo apt-add-repository "deb https://apt.dockerproject.org/repo ubuntu-$(lsb_release -cs) main"

# Update packages
sudo apt-get update

# Install specific version of engine 1.13.1
sudo apt-get -y install docker-engine=1.13.1-0~ubuntu-trusty

# Use as non-root user
sudo usermod -aG docker vagrant

# Install docker Compose
curl -L https://github.com/docker/compose/releases/download/1.11.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

# Apply executable permissions
sudo chmod +x /usr/local/bin/docker-compose