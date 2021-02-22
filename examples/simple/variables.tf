variable "vpc_security_group_ids" {
  type        = list(string)
  description = "(Required) List of VPC security groups to associate."
}

variable "kms_key_id" {
  type        = string
  description = "(Required) The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN."
}

variable "password" {
  type        = string
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
}

variable "vpc_id" {
  description = "(Required) VPC ID for fetching Subnet IDs"
}
