#!/bin/bash

mkdir -p $(pwd)/results

k3d cluster create \
    --servers 1 \
    --agents 3 \
    --k3s-node-label "node-type/role=infra@server:*" \
    --k3s-node-label "node-type/role=worker@agent:*" \
    --volume "$(pwd)/results:/tmp/results@agent:*" \
    --k3s-arg "--disable=metrics-server,traefik@server:*" 


# http
# fortio load -t 30s -qps 1000 -nocatchup -c 32 -uniform -sequential-warmup -a --labels "HTTP" http://localhost:8080

# # grpc
# fortio load -t 30s -qps 1000 -nocatchup -c 32 -grpc -ping -uniform -sequential-warmup -a --labels "gRPC" localhost:8079

# # tcp
# fortio load -t 30s -qps 1000 -nocatchup -c 32 -uniform -sequential-warmup -a --labels "TCP" tcp://localhost:8078

echo "The test results will be dumped in 'results' folder"