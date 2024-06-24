# Cert Manager

```bash
helm repo add jetstack https://charts.jetstack.io
helm repo update
# bash
latest_version=$(helm search repo cert-manager | grep jetstack/cert-manager | awk '{print $2}' | head -n 1)
# fish
set latest_version (helm search repo cert-manager | grep jetstack/cert-manager | awk '{print $2}' | head -n 1)

helm upgrade --install cert-manager jetstack/cert-manager --version $latest_version \
    --namespace cert-manager \
    --set installCRDs=true \
    --create-namespace \
    --set "extraArgs={--feature-gates=ExperimentalGatewayAPISupport=true}"

```
