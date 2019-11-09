#!/bin/sh -l

helm init --client-only

touch kubeconfig.yml && echo $KUBECONFIG_FILE > kubeconfig.yml

chmod +rwx kubeconfig.yml

helm repo update

export KUBECONFIG=$(pwd)/kubeconfig.yml

helm upgrade "$1" "$2"  --namespace="$3" --set="$4" --values="$5" --repo="$6" --username="$7" --password="$8" --wait --atomic --install