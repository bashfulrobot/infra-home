- Create A Record
- Create an [API Token](#api-tokens) for this domain in CF
- Create a secret in the namespace for the API Token. Example [here](Notes/longhorn/cm-le-lh-spitfire-secret.yaml).
- create the issuer for the cert-manager in the namespace your app is in. Example [here](Notes/longhorn/cm-le-prod-issuer.yaml). You may want to use the staging issuer first to test. Example [here](Notes/longhorn/cm-le-staging-issuer.yaml.
- Check on the status with `kubectl describe issuer letsencrypt-staging -n [namespace]`
- deploy the ingress with the cert-manager annotation. Example [here](Notes/longhorn/longhorn-ingress.yaml).
- Are the certs created? `kubectl get certificate -n [namespace]` or `kubectl describe certificate [cert-name] -n [namespace]`
- if you ever want to retrigger a new  cert, you will also need to delete the existing secret, which cert-manager is watching and will cause it to reprocess the request with the updated issuer. `kubectl delete secret [secret-name-tls] -n [namespace]`. This will start the process to get a new certificate, and using describe you can see the status.
- Can see the status of the order with `kubectl describe order [order-name] -n [namespace]`
- the 'Certificate' resource will be updated to reflect the state of the issuance process. If all is well, you should be able to 'describe' the Certificate and see something like: `kubectl describe certificate [cert-name-tls] -n [namespace]` and see `Status: True` and `Ready: True`

## API Tokens

Tokens can be created at User Profile > API Tokens > API Tokens. The following settings are recommended:

Permissions:
Zone - DNS - Edit
Zone - Zone - Read
Zone Resources:
Include - All Zones
