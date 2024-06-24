# Cilium Docs

## CNI Install

- edit `cilium-values.yaml` as needed

```bash
helm repo add cilium https://helm.cilium.io/
helm repo update
# bash
latest_version=$(helm search repo cilium | grep cilium/cilium | awk '{print $2}')
# fish
set latest_version (helm search repo cilium | grep cilium/cilium | awk '{print $2}')

helm upgrade --install --namespace kube-system cilium cilium/cilium --version $latest_version -f cilium-values.yaml
```

## Gateway API CRDs

run: `apply-latest-cilium-api-gw-crd.sh`

### apply-latest-cilium-api-gw-crd.sh

```bash
#!/bin/bash

# Fetch the latest release from the GitHub API
latest_version=$(helm search repo cilium | grep cilium/cilium | awk '{print $2}')

# Define the URLs
urls=(
"https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/VERSION/config/crd/standard/gateway.networking.k8s.io_gatewayclasses.yaml"
"https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/VERSION/config/crd/standard/gateway.networking.k8s.io_gateways.yaml"
"https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/VERSION/config/crd/standard/gateway.networking.k8s.io_httproutes.yaml"
"https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/VERSION/config/crd/standard/gateway.networking.k8s.io_referencegrants.yaml"
"https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/VERSION/config/crd/experimental/gateway.networking.k8s.io_grpcroutes.yaml"
"https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/VERSION/config/crd/experimental/gateway.networking.k8s.io_tlsroutes.yaml"
)

# Loop over the URLs and replace the version
for url in "${urls[@]}"; do
    url=${url/VERSION/$latest_version}
    kubectl apply -f $url
done
```

## ---- BELOW IS UNCONFIRMED --- ##

## Ingress & LB

Using Cilium Ingress

- <https://www.dbi-services.com/blog/combining-powerful-cilium-features-together-in-kubernetes/>>

- edit files first

k apply -f cilium-balancerpool.yaml

- edit ingress to get LB IP

kubectl edit svc cilium-ingress -n kube-system

- add label:

```
  cilium-lb: "true"
```

- is the external IP  showing: `kubectl get svc -A`

## Confirm below

I think this is just an ecamp0le of creating the ingress

```
k apply -f cilium-ingress.yaml
```
