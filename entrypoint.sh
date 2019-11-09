#!/bin/sh -l

touch kubeconfig && echo $KUBECONFIG_FILE > kubeconfig

KUBECONFIG=$(pwd)/kubeconfig

helm init --client-only

helm repo update

helm upgrade "$1" "$2"  --namespace="$3" --set="$4" --values="$5" --repo="$6" --username="$7" --password="$8"