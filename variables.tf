variable "create" {
  type        = bool
  description = "(Optional) Do you want to create DB resoruces"
  default     = true
}

# DB Subnet Group
variable "create_db_subnet_group_name" {
  type        = bool
  description = "Do you want to create DB subnet Group"
  default     = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "(Required) A list of VPC subnet IDs."
  default     = []
}

##### db_parameter_group
variable "create_parameter_group_name" {
  type        = bool
  description = "(Optional) Do you want to create Parameter Group"
  default     = false
}

variable "parameters" {
  type = list(object({
    name         = string
    value        = string
    apply_method = optional(string)
  }))
  description = <<_EOT
  (Optional) A list of DB parameters to apply with this parameter group. See the RDS User Guide for a list of valid parameters. Note that parameters may differ from a DB family to another. The following arguments are supported:
  name - (Required) The name of the DB parameter.
  value - (Required) The value of the DB parameter.
  apply_method - (Optional) The apply method of the DB parameter. Valid values are immediate and pending-reboot. Default is immediate.
  _EOT
  default     = []
}

variable "family" {
  type        = string
  description = "(Required, Forces new resource) The family of the DB parameter group."
}

################ DB instances ###########

variable "allocated_storage" {
  type        = number
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs."
}

variable "allow_major_version_upgrade" {
  type        = bool
  description = "(Optional) Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  default     = false
}

variable "apply_immediately" {
  type        = bool
  description = "Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false."
  default     = false
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "(Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true."
  default     = true
}

variable "availability_zone" {
  type        = string
  description = "(Optional) The AZ for the RDS instance."
  default     = null
}

variable "backup_retention_period" {
  type        = number
  description = "(Optional) The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica."
  default     = 35
}

variable "backup_target" {
  type        = string
  description = "(Optional, Forces new resource) Specifies where automated backups and manual snapshots are stored. Possible values are region (default) and outposts"
  default     = "region"
}

variable "backup_window" {
  type        = string
  description = "(Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: `09:46-10:16`. Must not overlap with maintenance_window"
  default     = "03:00-06:00"
}

variable "enable_blue_green_update" {
  type        = bool
  description = "(Optional) Enable Blue Green Update for RDS Deployment"
  default     = false
}

variable "ca_cert_identifier" {
  type        = string
  description = "(Optional) The identifier of the CA certificate for the DB instance."
  default     = null
}

variable "character_set_name" {
  type        = string
  description = "(Optional) The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed. "
  default     = null
}

variable "copy_tags_to_snapshot" {
  type        = bool
  description = "(Optional, boolean) Copy all Instance tags to snapshots. Default is false."
  default     = false
}

variable "custom_iam_instance_profile" {
  type        = string
  description = "(Optional) The instance profile associated with the underlying Amazon EC2 instance of an RDS Custom DB instance."
  default     = null
}

variable "db_name" {
  type        = string
  description = "(Optional) The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance. Note that this does not apply for Oracle or SQL Server engines. See the AWS documentation for more details on what applies for those engines. If you are providing an Oracle db name, it needs to be in all upper case. Cannot be specified for a replica."
  default     = null
}

variable "db_subnet_group_name" {
  type        = string
  description = "(Optional) Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. When working with read replicas, it should be specified only if the source database specifies an instance in another AWS Region."
  default     = null
}

variable "dedicated_log_volume" {
  type        = bool
  description = "(Optional, boolean) Use a dedicated log volume (DLV) for the DB instance. Requires Provisioned IOPS. See the AWS documentation for more details."
  default     = false
}

variable "delete_automated_backups" {
  type        = bool
  description = "(Optional) Specifies whether to remove automated backups immediately after the DB instance is deleted. Default is true."
  default     = true
}

variable "deletion_protection" {
  type        = bool
  description = "(Optional) If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. The default is false."
  default     = false
}

variable "domain" {
  type        = string
  description = "Optional) The ID of the Directory Service Active Directory domain to create the instance in."
  default     = null
}

variable "domain_auth_secret_arn" {
  type        = string
  description = "(Optional, but required if domain_fqdn is provided) The ARN for the Secrets Manager secret with the self managed Active Directory credentials for the user joining the domain. Conflicts with domain and domain_iam_role_name."
  default     = null
}

variable "domain_dns_ips" {
  type        = list(string)
  description = "(Optional, but required if domain_fqdn is provided) The IPv4 DNS IP addresses of your primary and secondary self managed Active Directory domain controllers. Two IP addresses must be provided. If there isn't a secondary domain controller, use the IP address of the primary domain controller for both entries in the list. Conflicts with domain and domain_iam_role_name."
  default     = null
}

variable "domain_fqdn" {
  type        = string
  description = "(Optional) The fully qualified domain name (FQDN) of the self managed Active Directory domain. Conflicts with domain and domain_iam_role_name."
  default     = null
}

variable "domain_iam_role_name" {
  type        = string
  description = " (Optional, but required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service."
  default     = null
}

variable "domain_ou" {
  type        = string
  description = "(Optional, but required if domain_fqdn is provided) The self managed Active Directory organizational unit for your DB instance to join. Conflicts with domain and domain_iam_role_name."
  default     = null
}


variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "(Optional) Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine). MySQL and MariaDB: audit, error, general, slowquery. PostgreSQL: postgresql, upgrade. MSSQL: agent , error. Oracle: alert, audit, listener, trace."
  default     = []
}

variable "engine" {
  type        = string
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The database engine to use. "
}

variable "engine_version" {
  type        = string
  description = " (Required) The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10) and this attribute will ignore differences in the patch version automatically (e.g. 5.7.17)."
}

variable "final_snapshot_identifier" {
  type        = string
  description = "(Optional) The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false. The value must begin with a letter, only contain alphanumeric characters and hyphens, and not end with a hyphen or contain two consecutive hyphens. Must not be provided when deleting a read replica."
  default     = "final"
}

variable "iam_database_authentication_enabled" {
  type        = bool
  description = "(Optional) Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  default     = false
}

variable "identifier" {
  type        = string
  description = "(Required) The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier. Required if restore_to_point_in_time is specified."
}

variable "instance_class" {
  type        = string
  description = "(Required) The instance type of the RDS instance."
}

variable "iops" {
  type        = number
  description = "(Optional) The amount of provisioned IOPS. Setting this implies a storage_type of `io`."
  default     = null
}

variable "kms_key_id" {
  type        = string
  description = "(Required) The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN."
  default     = null
}

variable "license_model" {
  type        = string
  description = "(Optional, but required for some DB engines, i.e. Oracle SE1) License model information for this DB instance."
  default     = null
}

variable "maintenance_window" {
  type        = string
  description = "(Optional) The window to perform maintenance in. Syntax: `ddd:hh24:mi-ddd:hh24:mi`. Eg: `Mon:00:00-Mon:03:00`. See RDS Maintenance Window docs for more information."
  default     = "Mon:00:00-Mon:03:00"
}

variable "manage_master_user_password" {
  type        = bool
  description = "(Optional) Set to true to allow RDS to manage the master user password in Secrets Manager. Cannot be set if password is provided."
  default     = null
}
variable "master_user_secret_kms_key_id" {
  type        = string
  description = "(Optional) The Amazon Web Services KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the KMS key. To use a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN. If not specified, the default KMS key for your Amazon Web Services account is used."
  default     = null
}

variable "max_allocated_storage" {
  type        = number
  description = "Optional) When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling."
  default     = 0
}

variable "monitoring_interval" {
  type        = number
  description = "(Optional) The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  default     = 0
}

variable "monitoring_role_arn" {
  type        = string
  description = "(Optional) The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. You can find more information on the AWS Documentation what IAM permissions are needed to allow Enhanced Monitoring for RDS Instances."
  default     = null
}

variable "multi_az" {
  type        = bool
  description = "(Optional) Specifies if the RDS instance is multi-AZ"
  default     = false
}

variable "nchar_character_set_name" {
  type        = string
  description = "Optional, Forces new resource) The national character set is used in the NCHAR, NVARCHAR2, and NCLOB data types for Oracle instances. This can't be changed."
  default     = null
}

variable "network_type" {
  type        = string
  description = "(Optional) The network type of the DB instance. Valid values: IPV4, DUAL."
  default     = "IPV4"
}

variable "option_group_name" {
  type        = string
  description = "(Optional) Name of the DB option group to associate."
  default     = null
}

variable "parameter_group_name" {
  type        = string
  description = "(Optional) Name of the DB parameter group to associate."
  default     = null
}

variable "password" {
  type        = string
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  sensitive   = true
}

variable "performance_insights_enabled" {
  type        = bool
  description = "(Optional) Specifies whether Performance Insights are enabled. Defaults to false."
  default     = false
}

variable "performance_insights_kms_key_id" {
  type        = string
  description = "(Optional) The ARN for the KMS key to encrypt Performance Insights data. When specifying performance_insights_kms_key_id, performance_insights_enabled needs to be set to true. Once KMS key is set, it can never be changed."
  default     = null
}

variable "performance_insights_retention_period" {
  type        = number
  description = "(Optional) The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years). When specifying performance_insights_retention_period, performance_insights_enabled needs to be set to true. Defaults to '7'."
  default     = null
}

variable "port" {
  type        = number
  description = "(Required) The port on which the DB accepts connections."
}

variable "publicly_accessible" {
  type        = bool
  description = "(Optional) Bool to control if instance is publicly accessible. Default is false."
  default     = false
}

variable "replica_mode" {
  type        = string
  description = "Optional) Specifies whether the replica is in either mounted or open-read-only mode. This attribute is only supported by Oracle instances. Oracle replicas operate in open-read-only mode unless otherwise specified. See Working with Oracle Read Replicas for more information."
  default     = null
}

variable "replicate_source_db" {
  type        = string
  description = "(Optional) Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate (if replicating within a single region) or ARN of the Amazon RDS Database to replicate (if replicating cross-region). Note that if you are creating a cross-region replica of an encrypted database you will also need to specify a kms_key_id."
  default     = null
}

variable "restore_to_point_in_time" {
  type = list(object({
    restore_time                             = optional(string)
    source_db_instance_identifier            = optional(string)
    source_db_instance_automated_backups_arn = optional(string)
    source_dbi_resource_id                   = optional(string)
    use_latest_restorable_time               = optional(bool)
  }))
  description = <<_EOT
  (Optional) The settings to restore a DB instance to a specific point in time. The following arguments are supported:
  restore_time - (Optional) The date and time to restore from. Valid values are in the format "YYYY-MM-DDTHH:MM:SSZ". Must be at least 5 minutes in the past.
  source_db_instance_identifier - (Optional) The identifier of the source DB instance from which to restore.
  source_db_instance_automated_backups_arn - (Optional) The ARN of the source DB instance from which to restore.
  source_dbi_resource_id - (Optional) The resource ID of the source DB instance from which to restore.
  use_latest_restorable_time - (Optional) When restoring from a DB snapshot, this value determines if the DB instance is restored from the latest backup time. By default, the DB instance is not restored from the latest backup time.
  _EOT
  default     = []
}

variable "s3_import" {
  type = list(object({
    bucket_name           = string
    bucket_prefix         = optional(string)
    ingestion_role        = string
    source_engine         = string
    source_engine_version = string
  }))
  description = <<_EOT
  (Optional) The settings to import data from an S3 bucket. The following arguments are supported:
  bucket_name - (Required) The name of the S3 bucket.
  bucket_prefix - (Optional) The prefix used when importing data from S3.
  ingestion_role - (Required) The name of the role to grant RDS to access the S3 bucket.
  source_engine - (Required) The name of the engine of the source database.
  source_engine_version - (Required) The version of the engine of the source database.
  _EOT
  default     = []
}

variable "skip_final_snapshot" {
  type        = bool
  description = "(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is false."
  default     = false
}

variable "snapshot_identifier" {
  type        = string
  description = "(Optional) Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
  default     = null
}

variable "storage_encrypted" {
  type        = bool
  description = "(Optional) Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms_key_id with a valid ARN. The default is true if not specified."
  default     = false
}

variable "storage_type" {
  type        = string
  description = "(Optional) One of \"standard\" (magnetic), \"gp2\" (general purpose SSD), \"gp3\" (general purpose SSD that needs iops independently) or \"io1\" (provisioned IOPS SSD). The default is \"io1\" if iops is specified, \"gp2\" if not."
  default     = "gp3"
}

variable "storage_throughput" {
  type        = number
  description = "(Optional) The storage throughput value for the DB instance. Can only be set when storage_type is \"gp3\". Cannot be specified if the allocated_storage value is below a per-engine threshold. See the RDS User Guide for details."
  default     = null
}

variable "timezone" {
  type        = string
  description = "(Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation."
  default     = null
}

variable "username" {
  type        = string
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Username for the master DB user."
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "(Required) List of VPC security groups to associate."
}

variable "customer_owned_ip_enabled" {
  type        = bool
  description = "(Optional) Indicates whether to enable a customer-owned IP address (CoIP) for an RDS on Outposts DB instance. See CoIP for RDS on Outposts for more information."
  default     = null
}


variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource."
  default     = {}
}

###############

variable "create_option_group_name" {
  type        = bool
  description = "(Optional) Do you want to create Option Group"
  default     = false
}

variable "engine_name" {
  type        = string
  description = "(Required) Specifies the name of the engine that this option group should be associated with."
  default     = null
}

variable "major_engine_version" {
  type        = string
  description = "(Required) Specifies the major version of the engine that this option group should be associated with."
  default     = null
}

variable "options" {
  type = list(object({
    option_name                    = string
    port                           = optional(number)
    version                        = optional(string)
    db_security_group_memberships  = optional(list(string))
    vpc_security_group_memberships = optional(list(string))
    option_settings = optional(list(object({
      name  = string
      value = string
    })))
  }))
  description = <<_EOT
  (Optional) A list of Options to apply with this option group. The following arguments are supported:
  option_name - (Required) The name of the option.
  port - (Optional) The port number that this option uses.
  version - (Optional) The version of the option.
  db_security_group_memberships - (Optional) A list of DB Security Groups to associate with this option.
  vpc_security_group_memberships - (Optional) A list of VPC Security Groups to associate with this option.
  option_settings - (Optional) A list of option settings to apply.
  _EOT
  default     = []
}
