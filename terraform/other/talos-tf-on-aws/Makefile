ACCESS_KEY := 15e081c1-c51d-4483-b798-2b164b0d5f3b
COLLECTOR := collector-staging2-new.sysdigcloud.com
CLUSTER_NAME := mavimo-talos

.PHONY: auth
auth:
	okta-aws-cli \
		--org-domain "sysdig.okta.com" \
		--oidc-client-id "0oaqz1xwwzHyCiV7A357" \
		--aws-acct-fed-app-id "0oaltf406vJIPOhrY356" \
		--aws-iam-idp "arn:aws:iam::059797578166:saml-provider/OKTA" \
		--aws-iam-role "arn:aws:iam::059797578166:role/developer" \
		--profile "draios-dev-developer" \
		--open-browser \
		--write-aws-credentials

.PHONY: init
init:
	@echo "Set your environment with:"
	@echo " "
	@echo "export TALOSCONFIG=$$(pwd)/talosconfig"
	@echo "export KUBECONFIG=$$(pwd)/kubeconfig"
	@echo " "
	@echo "And setup the CLUSTER_NAME in the make file to match the default value in the 'variables.tf'"

	terraform init

.PHONY: setup
setup:
	terraform apply -auto-approve

.PHONY: destroy
destroy:
	terraform destroy -auto-approve
	rm talosconfig
	rm kubeconfig

.PHONY: config
config:
	@terraform output -json talos_talosconfig | jq -r . > talosconfig
	@talosctl kubeconfig --talosconfig talosconfig --force
	@yq '.clusters[0].cluster.server = "https://$(shell yq '.contexts.*.endpoints[0]' talosconfig):6443"' -i kubeconfig

.PHONY: helm
helm:
	helm repo add sysdig https://charts.sysdig.com
	helm repo update
	helm upgrade --install -n sysdig-agent --create-namespace --set sysdig.accessKey=$(ACCESS_KEY) --set collectorSettings.collectorHost=$(COLLECTOR) --set ebpf.enabled=true --set ebpf.kind=universal_ebpf --set clusterName=$(CLUSTER_NAME) agent sysdig/agent
	kubectl -n sysdig-agent patch ds agent --patch 'spec:\n    template:\n        spec:\n            tolerations: []'