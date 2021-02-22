resource "aws_db_subnet_group" "this" {
  count       = var.create && var.create_db_subnet_group_name ? 1 : 0
  name_prefix = var.name_prefix
  description = format("Database subnet group for %s", var.identifier) #"Database subnet group for ${var.identifier}"
  subnet_ids  = var.subnet_ids

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
