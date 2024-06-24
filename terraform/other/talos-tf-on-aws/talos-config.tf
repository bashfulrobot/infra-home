resource "talos_machine_secrets" "machine_secrets" {
}

resource "talos_machine_configuration_controlplane" "machineconfig_cp" {
  cluster_name     = var.cluster_name
  cluster_endpoint =  "https://10.0.0.5:6443"
  machine_secrets  = talos_machine_secrets.machine_secrets.machine_secrets
  config_patches = [
    file("${path.module}/talos-patch.yaml")
  ]
  docs_enabled = false    
  examples_enabled = false
  kubernetes_version = var.kubernetes_version
  talos_version = var.talos_version
}

resource "talos_client_configuration" "talosconfig" {
  cluster_name    =  var.cluster_name
  machine_secrets = talos_machine_secrets.machine_secrets.machine_secrets
  endpoints       = [aws_instance.ec2.public_ip]
  nodes           = ["10.0.0.5"]
}
