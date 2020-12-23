#!/usr/bin/env bash
set -o errexit

curl -sL https://run.linkerd.io/install | sh
export PATH=$PATH:$HOME/.linkerd2/bin

linkerd check --pre

linkerd install | kubectl apply -f -

linkerd check

cat ./deploy.yaml | linkerd inject - | kubectl apply -f -

kubectl wait --for=condition=Ready pod -l app=server --timeout 300s
kubectl wait --for=condition=Ready pod -l app=client --timeout 300s
echo "ready, check logs of grpc client and server pods!"
