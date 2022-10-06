locals {
    cidr_block = "10.0.0.0/24"
    region = "us-east-1"
    vpc_name = "IaC VPC"
    tags = {
        "vpc_name" = "VPC Resource"
        "vpc_purpose" = "Testing and Validating resource deployments."
    }
    enable_dns_support  = true
    enable_dns_hostnames = true
    subnets = [
            {
                name = "Public Subnet 1"
                new_bits = 4
                az = "a"
            },
            {
                name = "Public Subnet 2"
                new_bits = 4
                az = "b"
            },
            {
                name = "Public Subnet 3"
                new_bits = 4
                az = "c"
            },
            {
                name = "Web Subnet 1"
                new_bits = 4
                az = "a"
            },
            {
                name = "Web Subnet 2"
                new_bits = 4
                az = "b"
            },
            {
                name = "Web Subnet 3"
                new_bits = 4
                az = "c"
            },
            {
                name = "Data Subnet 1"
                new_bits = 4
                az = "a"
            },
            {
                name = "Data Subnet 2"
                new_bits = 4
                az = "b"
            },
            {
                name = "Data Subnet 3"
                new_bits = 4
                az = "c"
            }
        ]
}
