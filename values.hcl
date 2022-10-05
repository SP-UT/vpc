locals {
    cidr_block = "10.0.0.0/16"
    tag = {
        "vpc_name" = "VPC Resource"
        "vpc_purpose" = "Testing and Validating resource deployments."
    }
    enable_dns_support  = true
    enable_dns_hostnames = true
}
