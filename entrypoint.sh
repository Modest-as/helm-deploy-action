#!/bin/sh -l

touch kubeconfig && echo $KUBECONFIG_FILE > kubeconfig

helm init --client-only

helm repo update

KUBECONFIG=$(pwd)/kubeconfig helm upgrade "$1" "$2"  --namespace="$3" --set="$4" --values="$5" --repo="$6" --username="$7" --password="$8" --wait --atomic --install