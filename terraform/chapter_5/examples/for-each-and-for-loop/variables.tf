variable "user_names" {
  description = "An array of user names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}

variable "hero_thousand_faces" {
  description = "Just a map example"
  type        = map(string)
  default = {
    neo      = "hero"
    trinity  = "badass"
    morpheus = "mentor"
  }
}