terraform {
  backend "s3" {
    bucket       = "terraform-state-bucket-squinelato-ch5"
    key          = "stage/services/webserver-cluster/terraform.tfstate"
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

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "terraform-state-bucket-squinelato-ch5"
  db_remote_state_key    = "stage/data-soure/mysql/terraform.tfstate"

  instance_type = "t3.micro"
  min_size      = 1
  max_size      = 2

  custom_tags = {
    Owner     = "team-john"
    ManagedBy = "terraform"
  }
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver_cluster.alb_security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}