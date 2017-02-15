#!/bin/bash

set -eu

# Build container
docker build -t haproxy-container /vagrant/haproxy

# Run contaienr and expose ports
docker run -d --publish 8080:80 --name haproxy-instance haproxy-container 