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
| [aws_nat_gateway.nat_gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eip_map"></a> [eip\_map](#input\_eip\_map) | Elastic IP address information with subnet mapping | `map` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | VPC Tags | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nat_gw"></a> [nat\_gw](#output\_nat\_gw) | NAT Gateway information with the Subnet and EIP allocation ID. |
<!-- END_TF_DOCS -->