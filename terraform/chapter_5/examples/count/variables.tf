variable "user_names" {
  description = "An array of user names"
  type = list(string)
  default = [ "neo", "morpheus" ]
}

variable "give_neo_cloudwatch_full_access" {
  description = "If true, neo gets acess to CloudWatch"
  type = bool
}