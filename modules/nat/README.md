<!-- BEGIN_TF_DOCS -->
### Execute Terragrunt  
#### Setup Provider
```
export AWS_ACCESS_KEY_ID=[YOUR_ACCESS_KEY_HERE]
export AWS_SECRET_ACCESS_KEY=[YOUR_SECRET_ACCESS_KEY_HERE]
export AWS_REGION=[YOUR_REGION_HERE]
```
#### Setup Terragrunt 
```
terragrunt init
```
#### Apply Terragrunt
```
terragrunt apply -target=module.vpc -target=module.igw -target=module.eip
terragrunt apply -target=module.nat
```
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
| <a name="output_nat_gw"></a> [nat\_gw](#output\_nat\_gw) | n/a |
<!-- END_TF_DOCS -->