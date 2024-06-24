# Longhorn Docs

```bash
helm repo add longhorn https://charts.longhorn.io
helm repo update
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace --version 1.6.2
kubectl -n longhorn-system get pod

kubectl apply -f ./certs/cm-le-lh-spitfire-secret.yaml
kubectl apply -f ./certs/cm-le-staging-issuer.yaml
kubectl apply -f ./certs/cm-le-prod-issuer.yaml

kubectl apply -f cilium-ingress-lh.yaml
kubectl edit svc cilium-ingress-longhorn-ingress -n longhorn-system
```
