terraform {
  backend "s3" {
    bucket       = "terraform-state-bucket-squinelato"
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

  cluster_name = "webservers-prod"
  db_remote_state_bucket = "terraform-state-bucket-squinelato"
  db_remote_state_key = "prod/data-soure/mysql/terraform.tfstate"

  instance_type = "t3.micro"
  min_size = 2
  max_size = 3
}

# only production will have auto scalling based on certain hours
resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale-out-during-business-hours"
  min_size = 2
  max_size = 3
  desired_capacity = 2
  recurrence = "0 9 * * *"
  time_zone = "America/Sao_Paulo"

  autoscaling_group_name = module.webserver_cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name = "scale-in-at-night"
  min_size = 2
  max_size = 3
  desired_capacity = 2
  recurrence = "0 17 * * *"
  time_zone = "America/Sao_Paulo"

  autoscaling_group_name = module.webserver_cluster.asg_name
}