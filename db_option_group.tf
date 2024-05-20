resource "aws_db_option_group" "this" {
  count = var.create && var.create_option_group_name ? 1 : 0

  name                     = format("%s-db-option-group", var.identifier)
  option_group_description = format("Option group for %s", var.identifier)
  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version

  dynamic "option" {
    for_each = var.options
    content {
      option_name                    = option.value.option_name
      port                           = try(option.value, "port", null)
      version                        = try(option.value, "version", null)
      db_security_group_memberships  = try(option.value, "db_security_group_memberships", null)
      vpc_security_group_memberships = try(option.value, "vpc_security_group_memberships", null)

      dynamic "option_settings" {
        for_each = try(option.value, "option_settings", [])
        content {
          name  = try(option_settings.value, "name", null)
          value = try(option_settings.value, "value", null)
        }
      }
    }
  }

  tags = var.tags
}
