#!/bin/sh -l

helm init --client-only --stable-repo-url https://charts.helm.sh/stable

echo "$KUBECONFIG_FILE" > ./kubeconfig

helm repo update

export KUBECONFIG=$(pwd)/kubeconfig

cd $GITHUB_WORKSPACE

helm upgrade "$INPUT_RELEASE" "$INPUT_CHART"  --namespace="$INPUT_NAMESPACE" --set="$INPUT_VALUES" --values="$INPUT_VALUEFILE" --repo="$INPUT_REPO" --username="$INPUT_USERNAME" --password="$INPUT_PASSWORD" --wait --atomic --install $INPUT_ARGS