terraform {
  backend "s3" {
    bucket       = "terraform-state-bucket-squinelato"
    key          = "prod/data-soure/mysql/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

module "data_storage_mysql" {
  source = "../../../modules/data-storage/mysql"

  database_name    = "db_prod"
  db_instance_type = "db.t3.micro"
}