locals {
  db_subnet_group_name = var.db_subnet_group_name != "" ? var.db_subnet_group_name : join("", aws_db_subnet_group.this.*.name)
}
