#!/usr/bin/env bash

set -e

CLUSTERNAME=$1

sed -r "s/^(\s*clusterName\s*:\s*).*/\1${CLUSTERNAME}/" -i ${PWD}/k8sdeploy-scripts/setk8sconfig.yaml
