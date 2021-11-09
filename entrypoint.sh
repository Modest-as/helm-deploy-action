#!/bin/sh -l

echo "Initiating helm"
helm init --client-only --stable-repo-url https://charts.helm.sh/stable

echo "Set kube config"
echo "$KUBECONFIG_FILE" > ./kubeconfig

echo "Updating helm repo"
helm repo update

echo "Set KUBECONFIG env variable"
export KUBECONFIG=$(pwd)/kubeconfig

echo "Switch to Github Workspace"
cd $GITHUB_WORKSPACE

echo "Upgrading helm release"
helm upgrade "$INPUT_RELEASE" "$INPUT_CHART"  --namespace="$INPUT_NAMESPACE" --set="$INPUT_VALUES" --values="$INPUT_VALUEFILE" --repo="$INPUT_REPO" --username="$INPUT_USERNAME" --password="$INPUT_PASSWORD" --wait --atomic --install $INPUT_ARGS