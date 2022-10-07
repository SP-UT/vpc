locals {
    values = read_terragrunt_config("values.hcl")
}
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}
EOF
}

inputs = {
    cidr_block = local.values.locals.cidr_block
    region = local.values.locals.region
    vpc_name = local.values.locals.vpc_name
    enable_dns_support = local.values.locals.enable_dns_support
    enable_dns_hostnames = local.values.locals.enable_dns_hostnames
    tags = local.values.locals.tags
    subnets = local.values.locals.subnets
}
