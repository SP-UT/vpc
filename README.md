# Execute Terragrunt  
## Setup Provider
```
export AWS_ACCESS_KEY_ID=[YOUR_ACCESS_KEY_HERE]
export AWS_SECRET_ACCESS_KEY=[YOUR_SECRET_ACCESS_KEY_HERE]
export AWS_REGION=[YOUR_REGION_HERE]
```
## Setup Terragrunt 
```
terragrunt init
```
## Apply Terragrunt
```
terragrunt apply -target=module.vpc -target=module.igw -target=module.eip
terragrunt apply -target=module.nat
```

<!-- BEGIN_TF_DOCS -->
# Module Documentation
  ## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.34.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eip"></a> [eip](#module\_eip) | ./modules/eip/ | n/a |
| <a name="module_igw"></a> [igw](#module\_igw) | ./modules/igw/ | n/a |
| <a name="module_nat"></a> [nat](#module\_nat) | ./modules/nat/ | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | VPC CIDR block | `string` | n/a | yes |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | A boolean flag to enable/disable DNS hostnames in the VPC | `bool` | `false` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | A boolean flag to enable/disable DNS support in the VPC. | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region to deploy the resources. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnet information necessary to create all the subnets. Please check [cidrsubnets](https://www.terraform.io/language/functions/cidrsubnets) for more info on `new_bits`. The `region` variable is used to associate the desired AZ. Usage : `join("",["us-east-1", "a"])`. Example: [values.hcl](https://github.com/SP-UT/vpc/blob/main/values.hcl#L15) | <pre>list(object({<br>    name     = string<br>    new_bits = number<br>    az       = string<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | VPC Tags | `map(string)` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eip"></a> [eip](#output\_eip) | Elastic IP address information |
| <a name="output_eip_map"></a> [eip\_map](#output\_eip\_map) | Elastic IP address information with subnet mapping |
| <a name="output_nat_gw"></a> [nat\_gw](#output\_nat\_gw) | NAT Gateway information with the Subnet and EIP allocation ID. |
| <a name="output_private_route_tables"></a> [private\_route\_tables](#output\_private\_route\_tables) | Private Route Table IDs. |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | Map of Private Subnet and associated subnet id created.`private_subnet_ids = {"Web or Data Subnet 1" = { "subnet_id" = "subnet-xxxxxxx"}` |
| <a name="output_public_route_table"></a> [public\_route\_table](#output\_public\_route\_table) | Public Route Table ID. |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | Map of Public Subnet and associated subnet id created.`public_subnet_ids = {"Public Subnet 1" = { "subnet_id" = "subnet-xxxxxxx"}` |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | CIDR information associated with each subnet. |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | Amazon Resource Name (ARN) of VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->
