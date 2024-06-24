output "talos_talosconfig" {
  value = talos_client_configuration.talosconfig.talos_config
  sensitive = true
}
