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
      version = "~> 4.0"
    }
  }
}
EOF
}

inputs = {
    cidr_block = local.values.locals.cidr_block
    enable_dns_support = local.values.locals.enable_dns_support
    enable_dns_hostnames = local.values.locals.enable_dns_hostnames
    tag = local.values.locals.tag
}
