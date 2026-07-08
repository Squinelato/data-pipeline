terraform {
  backend "s3" {
    bucket       = "terraform-state-bucket-squinelato"
    key          = "stage/data-soure/mysql/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

module "data_storage_mysql" {
  source = "../../../modules/data-storage/mysql"

  database_name    = "db_staging"
  db_instance_type = "db.t3.micro"
}