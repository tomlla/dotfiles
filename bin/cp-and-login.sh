#!/usr/bin/env bash

set -u
set -e

if [ $# != 2 ]; then
    echo "Usage: cp-and-login <k8s namespace> <relative file path from project root>" 1>&2;
    exit 1;
fi;

namespace=$1
srcpath=$2 # e.g.) lib/utils/

podid=$(kubectl -n $namespace get pods -l app -o name | cut -d '/' -f2 | head -1)

set -x
kubectl -n $namespace cp $srcpath $namespace/$podid:/app/${srcpath}
set +x
sleep 1
kubectl -n $namespace exec -it $podid bash