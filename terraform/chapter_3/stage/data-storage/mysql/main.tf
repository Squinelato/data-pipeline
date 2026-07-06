terraform {
  backend "s3" {
    bucket       = "terraform-state-bucket-squinelato"
    key          = "stage/data-soure/mysql/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "default" {
  identifier_prefix           = "terraform-up-and-running"
  allocated_storage           = 10
  db_name                     = "example_database"
  engine                      = "mysql"
  engine_version              = "8.0"
  instance_class              = "db.t3.micro"
  parameter_group_name        = "default.mysql8.0"
  skip_final_snapshot         = true
  username                    = "main_user"
  manage_master_user_password = true
}