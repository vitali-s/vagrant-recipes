#!/bin/bash

set -eu

cd /vagrant

# Build containers
docker-compose build

# Start container
docker-compose up -d