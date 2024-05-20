resource "aws_db_instance" "this" {
  count = var.create ? 1 : 0

  allocated_storage           = var.allocated_storage
  allow_major_version_upgrade = var.allow_major_version_upgrade
  apply_immediately           = var.apply_immediately
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade

  availability_zone       = var.availability_zone
  backup_retention_period = var.backup_retention_period

  backup_target = var.backup_target

  backup_window = var.backup_window

  dynamic "blue_green_update" {
    for_each = var.enable_blue_green_update ? [1] : []
    content {
      enabled = var.enable_blue_green_update
    }
  }

  ca_cert_identifier    = var.ca_cert_identifier
  character_set_name    = var.character_set_name
  copy_tags_to_snapshot = var.copy_tags_to_snapshot

  custom_iam_instance_profile = var.custom_iam_instance_profile

  db_name = var.db_name

  db_subnet_group_name = var.db_subnet_group_name == null && var.create_db_subnet_group_name ? aws_db_subnet_group.this[0].id : var.db_subnet_group_name

  dedicated_log_volume = var.dedicated_log_volume

  delete_automated_backups = var.delete_automated_backups
  deletion_protection      = var.deletion_protection
  domain                   = var.domain
  domain_auth_secret_arn   = var.domain_auth_secret_arn
  domain_dns_ips           = var.domain_dns_ips
  domain_fqdn              = var.domain_fqdn
  domain_iam_role_name     = var.domain_iam_role_name
  domain_ou                = var.domain_ou

  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports
  engine                              = var.engine
  engine_version                      = var.engine_version
  final_snapshot_identifier           = var.final_snapshot_identifier
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  identifier                          = var.identifier
  instance_class                      = var.instance_class
  iops                                = var.iops
  kms_key_id                          = var.storage_encrypted ? var.kms_key_id : null
  license_model                       = var.license_model
  maintenance_window                  = var.maintenance_window

  manage_master_user_password   = var.manage_master_user_password
  master_user_secret_kms_key_id = var.master_user_secret_kms_key_id
  max_allocated_storage         = var.max_allocated_storage
  monitoring_interval           = var.monitoring_interval
  monitoring_role_arn           = var.monitoring_role_arn
  multi_az                      = var.multi_az

  nchar_character_set_name = var.nchar_character_set_name

  network_type = var.network_type

  option_group_name               = var.create_option_group_name ? aws_db_option_group.this[0].id : var.option_group_name
  parameter_group_name            = var.create_parameter_group_name ? aws_db_parameter_group.this[0].id : var.parameter_group_name
  password                        = var.password
  performance_insights_enabled    = var.performance_insights_enabled
  performance_insights_kms_key_id = var.performance_insights_kms_key_id

  performance_insights_retention_period = var.performance_insights_retention_period
  port                                  = var.port
  publicly_accessible                   = var.publicly_accessible

  replica_mode        = var.replica_mode
  replicate_source_db = var.replicate_source_db

  dynamic "restore_to_point_in_time" {
    for_each = var.restore_to_point_in_time
    content {
      restore_time                             = lookup(restore_to_point_in_time.value, "restore_time", null)
      source_db_instance_identifier            = lookup(restore_to_point_in_time.value, "source_db_instance_identifier", null)
      source_db_instance_automated_backups_arn = lookup(restore_to_point_in_time.value, "source_db_instance_automated_backups_arn", null)
      source_dbi_resource_id                   = lookup(restore_to_point_in_time.value, "source_dbi_resource_id", null)
      use_latest_restorable_time               = lookup(restore_to_point_in_time.value, "use_latest_restorable_time", null)
    }

  }

  dynamic "s3_import" {
    for_each = var.s3_import
    content {
      bucket_name           = s3_import.value.bucket_name
      bucket_prefix         = lookup(s3_import.value, "bucket_prefix", null)
      ingestion_role        = s3_import.value.ingestion_role
      source_engine         = s3_import.value.source_engine
      source_engine_version = s3_import.value.source_engine_version
    }

  }

  skip_final_snapshot = var.skip_final_snapshot
  snapshot_identifier = var.snapshot_identifier
  storage_encrypted   = var.storage_encrypted
  storage_type        = var.storage_type
  storage_throughput  = var.storage_throughput
  username            = var.username
  timezone            = var.timezone

  vpc_security_group_ids    = var.vpc_security_group_ids
  customer_owned_ip_enabled = var.customer_owned_ip_enabled

  tags = var.tags
}
