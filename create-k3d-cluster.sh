#!/usr/bin/env bash
set -o errexit

k3d cluster create local \
    --port 80:80@loadbalancer \
    --port 443:443@loadbalancer \
    --wait \
    --switch-context \
    --timeout 60s \
    --k3s-server-arg --no-deploy \
    --k3s-server-arg traefik