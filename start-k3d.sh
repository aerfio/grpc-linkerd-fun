#!/usr/bin/env bash
set -o errexit

./create-k3d-cluster.sh
./install-components.sh