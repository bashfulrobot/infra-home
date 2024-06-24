module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.cluster_name
  cidr = "10.0.0.0/18"

  public_subnets = ["10.0.0.0/24"]
  azs             = ["eu-central-1a"]

  tags = {
    Name = var.cluster_name
  }
}

resource "aws_security_group" "security_group" {
  vpc_id = module.vpc.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "Egress everywhere"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "Ingress everywhere"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.cluster_name
  }
}

data "aws_ami" "talos" {
  most_recent = true
  filter {
    name   = "name"
    values = ["talos-${var.talos_version}-eu-central-1-amd64"]
  }
  owners = ["540036508848"] 
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.talos.id
  instance_type = "m5a.xlarge"

  subnet_id = module.vpc.public_subnets[0]

  private_ip = "10.0.0.5"
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.security_group.id]

  user_data = talos_machine_configuration_controlplane.machineconfig_cp.machine_config

  tags = {
    Name = var.cluster_name
  }
}
