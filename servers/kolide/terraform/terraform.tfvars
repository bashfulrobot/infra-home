#### User Variables
# User Name
admin_name = "dustin"
# User Password Hash
admin_password_hash = "$6$eSiMWLr1mDaOtUGX$9N3ExuWLeo3lqA4P7DFxrTB2fQIS/1rIAzXDmLn/IOPlXdJ.yiEUIP2xuGrodxeATCM5QOsC8PMjM2hI73uE91"
# User SSH Public Key
path_to_ssh_public_key = "~/.ssh/id_ed25519.pub"

#### Cluster/Host Variables
# Cluster Name
cluster_name = "kolide-test"
# Cluster Host Prefix
host_prefix = "dustin-"
# Cluster VM Host Suffix
vm_host_suffix = ""

#### Network Variables
# Network Subnet - Should be a /24
kvm_subnet = "10.100.0.0/24"
# Network Subnet Prefix - Should be the same as kvm_subnet first three octets
kvm_subnet_prefix = "10.100.0"

#### VM Variables
# How many VMs to create
vm_count = 1
# Number of vCPUs to assign to each VM
vm_vcpu = 4
# Amount of memory to assign to each VM in GB
vm_memory = 8
# Size of the OS disk in GB
vm_os_disk_size = 100

#### Libvirt Variables
# Ubuntu Cloud Image URL location
image_url = "file:///var/lib/libvirt/images/jammy-server-cloudimg-amd64-disk-kvm.img"
# Auto start VMs on boot
autostart = true
