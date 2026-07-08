provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "default" {
  identifier_prefix           = "terraform-up-and-running"
  allocated_storage           = 10
  db_name                     = var.database_name
  engine                      = "mysql"
  engine_version              = "8.0"
  instance_class              = var.db_instance_type
  parameter_group_name        = "default.mysql8.0"
  skip_final_snapshot         = true
  username                    = "main_user"
  manage_master_user_password = true
}