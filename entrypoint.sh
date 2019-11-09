#!/bin/sh -l

touch kubeconfig && echo $KUBECONFIG_FILE > kubeconfig

KUBECONFIG=$(pwd)/kubeconfig

helm init --client-only

helm repo update

helm upgrade "$3" --name="$1" --namespace="$2" --set="$4" --values="$5" --repo="$6" --username="$7" --password="$8"