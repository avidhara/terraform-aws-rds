resource "aws_db_parameter_group" "this" {
  count = var.create && var.create_parameter_group_name ? 1 : 0

  name        = format("%s-db-parameter-group", var.identifier)
  description = format("Database parameter group for %s", var.identifier)
  family      = var.family

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", "immediate") # lookup(parameter.value, "apply_method", "immediate")
    }
  }

  tags = var.tags
}
