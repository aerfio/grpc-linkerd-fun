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

curl -sL https://run.linkerd.io/install | sh
export PATH=$PATH:$HOME/.linkerd2/bin

linkerd check --pre

linkerd install | kubectl apply -f -

linkerd check


cat ./deploy.yaml | linkerd inject - | kubectl apply -f -