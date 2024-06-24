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
  --set-string oauth.clientId=kr2kZ83CNTRL \
  --set-string oauth.clientSecret=tskey-client-kr2kZ83CNTRL-M7XC3u2sVa1QGjC3u2sVa1zav1rf13jtg \
  --wait

```
