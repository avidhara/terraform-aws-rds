resource "aws_db_instance" "this" {
  engine             = var.engine
  engine_version     = var.engine_version
  port               = var.port
  license_model      = var.license_model
  character_set_name = var.character_set_name

  identifier         = var.identifier
  availability_zone  = var.availability_zone
  ca_cert_identifier = var.ca_cert_identifier

  replicate_source_db = var.replicate_source_db
  snapshot_identifier = var.snapshot_identifier

  instance_class        = var.instance_class
  allocated_storage     = var.allocated_storage
  storage_type          = var.storage_type
  iops                  = var.iops
  max_allocated_storage = var.max_allocated_storage
  storage_encrypted     = var.storage_encrypted
  kms_key_id            = var.storage_encrypted ? var.kms_key_id : null

  name                                = var.name
  username                            = var.username
  password                            = var.password
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  domain                              = var.domain
  domain_iam_role_name                = var.domain_iam_role_name

  parameter_group_name = var.parameter_group_name == "" && var.create_parameter_group_name ? join("", aws_db_parameter_group.this.*.name) : var.parameter_group_name
  option_group_name    = var.option_group_name == "" && var.create_option_group_name ? join("", aws_db_option_group.this.*.name) : var.option_group_name

  backup_retention_period    = var.backup_retention_period
  backup_window              = var.backup_window
  maintenance_window         = var.maintenance_window
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  final_snapshot_identifier  = var.final_snapshot_identifier
  skip_final_snapshot        = var.skip_final_snapshot
  copy_tags_to_snapshot      = var.copy_tags_to_snapshot

  monitoring_interval                   = var.monitoring_interval
  monitoring_role_arn                   = var.monitoring_role_arn
  enabled_cloudwatch_logs_exports       = var.enabled_cloudwatch_logs_exports
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_retention_period


  publicly_accessible  = var.publicly_accessible
  db_subnet_group_name = var.db_subnet_group_name == "" && var.create_db_subnet_group_name ? join("", aws_db_subnet_group.this.*.id) : var.db_subnet_group_name
  multi_az             = var.multi_az


  vpc_security_group_ids = var.vpc_security_group_ids


  deletion_protection         = var.deletion_protection
  delete_automated_backups    = var.delete_automated_backups
  allow_major_version_upgrade = var.allow_major_version_upgrade
  apply_immediately           = var.apply_immediately

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
