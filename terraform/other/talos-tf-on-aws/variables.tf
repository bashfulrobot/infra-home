variable "cluster_name" {
    type = string
    description = "Cluster name"
    default = "mavimo-talos"
}

variable "talos_version" {
    type = string
    description = "Talos version to use"
    default = "v1.3.5"
}

variable "kubernetes_version" {
    type = string
    description = "Kubernetes version to use"
    default = "1.24.3"
}