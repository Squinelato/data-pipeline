variable "database_name" {
  description = "The name of the database"
  type        = string
}

variable "db_instance_type" {
  description = "The AWS EC2 type (e.g. db.t3.micro)"
  type        = string
}