#!/bin/bash

# Edit VPP commit id in build-vpp.sh

docker build -t vppbuild . -f Dockerfile.build

# Extract deb packages
id=$(docker create vppbuild)
docker cp $id:/root/vpp.tar .
docker rm -v $id

# Build image
docker build -t ligato/vppdeb .

#docker tag ligato/vppdeb:latest ligato/vppdeb:VPP_TAG
