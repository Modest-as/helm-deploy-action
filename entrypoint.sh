#!/bin/sh -l

helm init --client-only

echo $KUBECONFIG_FILE | base64 -d > ./kubeconfig

helm repo update

export KUBECONFIG=$(pwd)/kubeconfig

helm upgrade "$1" "$2"  --namespace="$3" --set="$4" --values="$5" --repo="$6" --username="$7" --password="$8" --wait --atomic --install