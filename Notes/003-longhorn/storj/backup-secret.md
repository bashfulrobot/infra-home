## Deploying Longhorn

You may already have Longhorn set up on your cluster. If not, and you are using Civo K3s this is as easy as going to the marketplace and installing the app. After a minute you should see all the Longhorn pods up and running.

The first thing we need to do is store your storj connection information in a Kubernetes secret. To do this we need to convert each value to BASE64, replacing the values below with your URL, access key and secret:

> Your Storj URL should look something like: <https://gateway.us1.storjshare.io>

```
echo -n https://gateway.us1.storjshare.io | base64
echo -n aws_access_key_id | base64
echo -n aws_secret_access_key | base64
```

You will see something like the following:

```
TUlOSU9fVVJM
YXdzX2FjY2Vzc19rZXlfaWQ=
YXdzX3NlY3JldF9hY2Nlc3Nfa2V5
```

Once you have these values we can generate the secret (make sure you replace the data values with your BASE64 ones):

```
cat &lt;&lt;EOF &gt;&gt;aws_secret.yml
apiVersion: v1
kind: Secret
metadata:
  name: aws-secret
  namespace: longhorn-system
type: Opaque
data:
  AWS_ACCESS_KEY_ID: TUlOSU9fVVJM
  AWS_SECRET_ACCESS_KEY: YXdzX2FjY2Vzc19rZXlfaWQ=
  AWS_ENDPOINTS: YXdzX3NlY3JldF9hY2Nlc3Nfa2V5
EOF
```

We can now apply the manifest to create the secret:

```
kubectl apply -f aws_secret.yml
```

You can check this has been created by running:

```
kubectl get secrets -n longhorn-system
```

Then in the interface use:

- unser general in settings. Search for "Backup Target"
```
s3:YOURBUCKET@us1

s3://spitfire@us1/

storj-secret
```
