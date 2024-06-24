terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    talos = {
      source = "siderolabs/talos"
      version = "0.1.2"
    }
  }

  required_version = ">= 1.0"
}
