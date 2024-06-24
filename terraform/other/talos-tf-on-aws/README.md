# Agent on Talos

## Pre-requirements

You need to have `talosctl`, `kubectl`, `terraform`, `jq` and `yq`

## Setup

2. Initialize terraform with `make init` (and set the env variables as specified)
1. Authenticate on AWS with `make auth`
3. Setup the infrastructure with `make setup`
4. Get the local config with `make config`
5. Customize the value in the `Makefile` (collector, token, cluster name, chart location)
6. Setup the agent with `make helm` (need to use the chart version with Universal eBPF support)
