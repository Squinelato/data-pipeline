output "address" {
  value       = module.data_storage_mysql.address
  description = "Connect to the database at this endpoint"
}

output "port" {
  value       = module.data_storage_mysql.port
  description = "The port the database is listening on"
}