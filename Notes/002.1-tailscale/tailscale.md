# Tailscale

- need to read teh docs. THis is just to apply. All the ACL/etc are in teh docs.

```
# Add the repository
helm repo add tailscale https://pkgs.tailscale.com/helmcharts

# Update your client’s package list
helm repo update

helm upgrade --install tailscale-operator tailscale/tailscale-operator \
  --namespace=tailscale \
  --create-namespace \
  --set-string oauth.clientId=xxxxxxx \
  --set-string oauth.clientSecret=xxxxxxxx \
  --wait

```
