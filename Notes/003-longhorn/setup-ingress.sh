#!/usr/bin/env bash

USER=admin
PASSWORD=2ert23=1q2w
echo "${USER}:$(openssl passwd -stdin -apr1 <<<${PASSWORD})" >>auth

kubectl -n longhorn-system create secret generic basic-auth --from-file=auth
