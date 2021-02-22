
# Simple MySql example for AWS RDS
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| mysql | ../../ |  |

## Resources

| Name |
|------|
| [aws_subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| kms\_key\_id | (Required) The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. | `string` | n/a | yes |
| password | (Required unless a snapshot\_identifier or replicate\_source\_db is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. | `string` | n/a | yes |
| vpc\_id | (Required) VPC ID for fetching Subnet IDs | `any` | n/a | yes |
| vpc\_security\_group\_ids | (Required) List of VPC security groups to associate. | `list(string)` | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
