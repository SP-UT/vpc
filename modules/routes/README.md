<!-- BEGIN_TF_DOCS -->
# Module Documentation
  ## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.public_routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.az3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.az1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.az2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.az3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_nat_gateways.public_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/nat_gateways) | data source |
| [aws_nat_gateways.public_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/nat_gateways) | data source |
| [aws_nat_gateways.public_subnet_3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/nat_gateways) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_igw"></a> [igw](#input\_igw) | Internet Gaetway ID. | `string` | n/a | yes |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | VPC Private Subnet mapped to corresponding CIDRs. | `map(map(string))` | n/a | yes |
| <a name="input_public_subnet_ids"></a> [public\_subnet\_ids](#input\_public\_subnet\_ids) | VPC Public Subnet mapped to corresponding CIDRs. | `map(map(string))` | n/a | yes |
| <a name="input_route_az1_map"></a> [route\_az1\_map](#input\_route\_az1\_map) | Private Subnets and Public Subnet Mapping for Availability Zone 1. | `map(any)` | n/a | yes |
| <a name="input_route_az2_map"></a> [route\_az2\_map](#input\_route\_az2\_map) | Private Subnets and Public Subnet Mapping for Availability Zone 2. | `map(any)` | n/a | yes |
| <a name="input_route_az3_map"></a> [route\_az3\_map](#input\_route\_az3\_map) | Private Subnets and Public Subnet Mapping for Availability Zone 3. | `map(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | VPC Tags | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_route"></a> [public\_route](#output\_public\_route) | Public Route ID - sending traffic to Internet Gateway |
| <a name="output_public_route_table"></a> [public\_route\_table](#output\_public\_route\_table) | Public Route Table ID. |
| <a name="output_route_table_az1"></a> [route\_table\_az1](#output\_route\_table\_az1) | Private Route Table ID - AZ1 |
| <a name="output_route_table_az2"></a> [route\_table\_az2](#output\_route\_table\_az2) | Private Route Table ID - AZ2 |
| <a name="output_route_table_az3"></a> [route\_table\_az3](#output\_route\_table\_az3) | Private Route Table ID - AZ3 |
<!-- END_TF_DOCS -->