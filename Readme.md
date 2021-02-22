# Terraform module for AWS RDS
Check the [examples](/examples/) folder

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.7, < 0.14 |
| aws | >= 2.68, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.68, < 4.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_db_instance](https://registry.terraform.io/providers/hashicorp/aws/4.0/docs/resources/db_instance) |
| [aws_db_option_group](https://registry.terraform.io/providers/hashicorp/aws/4.0/docs/resources/db_option_group) |
| [aws_db_parameter_group](https://registry.terraform.io/providers/hashicorp/aws/4.0/docs/resources/db_parameter_group) |
| [aws_db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/4.0/docs/resources/db_subnet_group) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allocated\_storage | (Required unless a snapshot\_identifier or replicate\_source\_db is provided) The allocated storage in gibibytes. If max\_allocated\_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. | `number` | n/a | yes |
| allow\_major\_version\_upgrade | (Optional) Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible. | `bool` | `false` | no |
| apply\_immediately | Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. | `bool` | `false` | no |
| auto\_minor\_version\_upgrade | (Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true. | `bool` | `true` | no |
| availability\_zone | (Optional) The AZ for the RDS instance. | `string` | `null` | no |
| backup\_retention\_period | (Optional) The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica. | `number` | `35` | no |
| backup\_window | (Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: `09:46-10:16`. Must not overlap with maintenance\_window | `string` | `"03:00-06:00"` | no |
| ca\_cert\_identifier | (Optional) The identifier of the CA certificate for the DB instance. | `string` | `null` | no |
| character\_set\_name | (Optional) The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed. | `string` | `null` | no |
| copy\_tags\_to\_snapshot | (Optional, boolean) Copy all Instance tags to snapshots. Default is false. | `bool` | `false` | no |
| create | (Optional) Do you want to create DB resoruces | `bool` | `true` | no |
| create\_db\_subnet\_group\_name | Do you want to create DB subnet Group | `bool` | `true` | no |
| create\_option\_group\_name | (Optional) Do you want to create Option Group | `bool` | `false` | no |
| create\_parameter\_group\_name | (Optional) Do you wan to create Paramter Group | `bool` | `false` | no |
| db\_subnet\_group\_name | (Optional) Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. When working with read replicas, it should be specified only if the source database specifies an instance in another AWS Region. | `string` | `""` | no |
| delete\_automated\_backups | (Optional) Specifies whether to remove automated backups immediately after the DB instance is deleted. Default is true. | `bool` | `true` | no |
| deletion\_protection | (Optional) If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. The default is false. | `bool` | `false` | no |
| domain | Optional) The ID of the Directory Service Active Directory domain to create the instance in. | `string` | `null` | no |
| domain\_iam\_role\_name | (Optional, but required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service. | `string` | `null` | no |
| enabled\_cloudwatch\_logs\_exports | (Optional) Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine). MySQL and MariaDB: audit, error, general, slowquery. PostgreSQL: postgresql, upgrade. MSSQL: agent , error. Oracle: alert, audit, listener, trace. | `list(string)` | `[]` | no |
| engine | (Required unless a snapshot\_identifier or replicate\_source\_db is provided) The database engine to use. | `string` | n/a | yes |
| engine\_name | (Required) Specifies the name of the engine that this option group should be associated with. | `string` | `null` | no |
| engine\_version | (Required) The engine version to use. If auto\_minor\_version\_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10) and this attribute will ignore differences in the patch version automatically (e.g. 5.7.17). | `string` | n/a | yes |
| family | (Required, Forces new resource) The family of the DB parameter group. | `string` | `null` | no |
| final\_snapshot\_identifier | (Optional) The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip\_final\_snapshot is set to false. The value must begin with a letter, only contain alphanumeric characters and hyphens, and not end with a hyphen or contain two consecutive hyphens. Must not be provided when deleting a read replica. | `string` | `"final"` | no |
| iam\_database\_authentication\_enabled | (Optional) Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled. | `bool` | `false` | no |
| identifier | (Required) The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier. Required if restore\_to\_point\_in\_time is specified. | `string` | n/a | yes |
| instance\_class | (Required) The instance type of the RDS instance. | `string` | n/a | yes |
| iops | (Optional) The amount of provisioned IOPS. Setting this implies a storage\_type of `io`. | `number` | `0` | no |
| kms\_key\_id | (Required) The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. | `string` | n/a | yes |
| license\_model | (Optional, but required for some DB engines, i.e. Oracle SE1) License model information for this DB instance. | `string` | `""` | no |
| maintenance\_window | (Optional) The window to perform maintenance in. Syntax: `ddd:hh24:mi-ddd:hh24:mi`. Eg: `Mon:00:00-Mon:03:00`. See RDS Maintenance Window docs for more information. | `string` | `"Mon:00:00-Mon:03:00"` | no |
| major\_engine\_version | (Required) Specifies the major version of the engine that this option group should be associated with. | `string` | `null` | no |
| max\_allocated\_storage | Optional) When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage. Must be greater than or equal to allocated\_storage or 0 to disable Storage Autoscaling. | `number` | `0` | no |
| monitoring\_interval | (Optional) The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60. | `number` | `0` | no |
| monitoring\_role\_arn | (Optional) The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. You can find more information on the AWS Documentation what IAM permissions are needed to allow Enhanced Monitoring for RDS Instances. | `string` | `null` | no |
| multi\_az | (Optional) Specifies if the RDS instance is multi-AZ | `bool` | `false` | no |
| name | (Optional) The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance. Note that this does not apply for Oracle or SQL Server engines. See the AWS documentation for more details on what applies for those engines. | `string` | `"example"` | no |
| name\_prefix | (Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name | `string` | `""` | no |
| option\_group\_description | (Optional) The description of the option group. Defaults to `Managed by Terraform`. | `string` | `"Managed by Terraform"` | no |
| option\_group\_name | (Optional) Name of the DB option group to associate. | `string` | `""` | no |
| options | (Optional) A list of Options to apply. | `any` | `[]` | no |
| parameter\_group\_name | (Optional) Name of the DB parameter group to associate. | `string` | `""` | no |
| parameters | (Optional) A list of DB parameters to apply. Note that parameters may differ from a family to an other. Full list of all parameters can be discovered via aws rds describe-db-parameters after initial creation of the group. | `list(map(string))` | `[]` | no |
| password | (Required unless a snapshot\_identifier or replicate\_source\_db is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. | `string` | n/a | yes |
| performance\_insights\_enabled | (Optional) Specifies whether Performance Insights are enabled. Defaults to false. | `bool` | `false` | no |
| performance\_insights\_kms\_key\_id | (Optional) The ARN for the KMS key to encrypt Performance Insights data. When specifying performance\_insights\_kms\_key\_id, performance\_insights\_enabled needs to be set to true. Once KMS key is set, it can never be changed. | `string` | `null` | no |
| performance\_insights\_retention\_period | (Optional) The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years). When specifying performance\_insights\_retention\_period, performance\_insights\_enabled needs to be set to true. Defaults to '7'. | `number` | `null` | no |
| port | (Required) The port on which the DB accepts connections. | `number` | n/a | yes |
| publicly\_accessible | (Optional) Bool to control if instance is publicly accessible. Default is false. | `bool` | `false` | no |
| replicate\_source\_db | (Optional) Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate (if replicating within a single region) or ARN of the Amazon RDS Database to replicate (if replicating cross-region). Note that if you are creating a cross-region replica of an encrypted database you will also need to specify a kms\_key\_id. | `string` | `""` | no |
| skip\_final\_snapshot | (Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier. Default is false. | `bool` | `false` | no |
| snapshot\_identifier | (Optional) Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05. | `string` | `null` | no |
| storage\_encrypted | (Optional) Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms\_key\_id with a valid ARN. The default is true if not specified. | `bool` | `true` | no |
| storage\_type | (Optional) One of `standard` (magnetic), `gp2` (general purpose SSD), or `io1` (provisioned IOPS SSD). The default is `io1` if iops is specified, `gp2` if not. | `string` | `"gp2"` | no |
| subnet\_ids | (Required) A list of VPC subnet IDs. | `list(string)` | `[]` | no |
| tags | (Optional) A map of tags to assign to the resource. | `map(string)` | `{}` | no |
| timezone | (Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. | `string` | `""` | no |
| username | (Required unless a snapshot\_identifier or replicate\_source\_db is provided) Username for the master DB user. | `string` | n/a | yes |
| vpc\_security\_group\_ids | (Required) List of VPC security groups to associate. | `list(string)` | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
