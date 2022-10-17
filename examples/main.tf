variable "build_number" {
    type = string
    default = "1"
}
variable "created_by" {
    type = string
    default = "shane"
}
variable "managed_by"{
    type = string
    default = "terraform"
}

module "vpc" {
  source = "../"

  aws_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_cidr = "11.0.0.0/16"
  private_subnets = "true"

  ## Tags
  tags = {
    build_number = var.build_number
    created_by = var.created_by
    managed_by = var.managed_by
  }
}

output "vpc" {
  value = "${module.vpc.vpc_id}"
}

output "subnets" {
  value = "${module.vpc.subnet_ids}"
}

output "private_subnets" {
  value = "${module.vpc.private_subnet_ids}"
}