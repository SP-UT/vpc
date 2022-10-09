<!-- BEGIN_TF_DOCS -->
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
| [aws_subnet.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

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
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | Map of Private Subnet and associated subnet id created.`private_subnet_ids = {"Web or Data Subnet 1" = { "subnet_id" = "subnet-xxxxxxx"}` |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | Map of Public Subnet and associated subnet id created.`public_subnet_ids = {"Public Subnet 1" = { "subnet_id" = "subnet-xxxxxxx"}` |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | CIDR information associated with each subnet. |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | Amazon Resource Name (ARN) of VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->