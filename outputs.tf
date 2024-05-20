output "address" {
  description = "The hostname of the RDS instance. "
  value       = try(aws_db_instance.this[0].endpoint, null)
}

output "endpoint" {
  description = "The connection endpoint in address:port format."
  value       = try(aws_db_instance.this[0].endpoint, null)
}

output "engine_version_actual" {
  description = "The running version of the database."
  value       = try(aws_db_instance.this[0].engine_version_actual, null)
}

output "id" {
  description = "RDS DBI resource ID."
  value       = try(aws_db_instance.this[0].id, null)
}

output "resource_id" {
  description = "The RDS Resource ID of this instance."
  value       = try(aws_db_instance.this[0].resource_id, null)
}

output "status" {
  description = "The RDS instance status."
  value       = try(aws_db_instance.this[0].status, null)
}

