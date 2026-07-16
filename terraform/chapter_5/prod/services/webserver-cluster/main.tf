terraform {
  backend "s3" {
    bucket       = "terraform-state-bucket-squinelato-ch5"
    key          = "prod/services/webserver-cluster/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  server_text = "Hello, world!"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "terraform-state-bucket-squinelato-ch5"
  db_remote_state_key    = "prod/data-soure/mysql/terraform.tfstate"

  instance_type = "t3.micro"
  min_size      = 2
  max_size      = 3

  enable_autoscaling = true

  custom_tags = {
    Owner     = "team-john"
    ManagedBy = "terraform"
  }
}