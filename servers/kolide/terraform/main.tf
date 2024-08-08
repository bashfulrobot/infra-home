
module "network" {
  source = "github.com/bashfulrobot/libvirt-module-network"

  #### Network Variables
  kvm_subnet        = var.kvm_subnet
  kvm_subnet_prefix = var.kvm_subnet_prefix
  network_name      = var.cluster_name

}

module "vm" {
  source = "github.com/bashfulrobot/libvirt-module-vm"

  #### User Variables
  admin_name             = var.admin_name
  admin_password_hash    = var.admin_password_hash
  path_to_ssh_public_key = var.path_to_ssh_public_key

  #### Cluster/Host Variables
  cluster_name = var.cluster_name
  host_prefix  = var.host_prefix
  host_suffix  = var.vm_host_suffix

  #### Network Variables
  network_domain    = module.network.network_domain
  network_id        = module.network.network_id
  kvm_subnet_prefix = var.kvm_subnet_prefix

  #### VM Variables
  vm_vcpu         = var.vm_vcpu
  vm_memory       = var.vm_memory
  vm_os_disk_size = var.vm_os_disk_size
  vm_count        = var.vm_count

  #### Libvirt Variables
  image_url = var.image_url
  autostart = var.autostart

}
