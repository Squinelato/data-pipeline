output "all_arns" {
  value       = values(aws_iam_user.users)[*].arn
  description = "The ARN of the all users"
}

output "upper_names" {
  value = [for name in var.user_names : upper(name)]
}

output "short_upper_names" {
  value = [for name in var.user_names : upper(name) if length(name) > 5]
}

output "bios" {
  value = [for name, role in var.hero_thousand_faces : "${name} is the ${role}"]
}

output "name_maps" {
  value = {for name, role in var.hero_thousand_faces : upper(name) => upper(role)}
}

output "for_directives" {
  value = "%{ for name in var.user_names }${name}, %{ endfor }"
}

output "for_directives_with_indexes" {
  value = "%{ for index, name in var.user_names }(${index}) ${name}, %{ endfor }"
}

output "for_directives_indexes_if" {
  value = <<EOF
  %{~ for i, name in var.user_names ~}
  ${name}%{ if i < length(var.user_names) - 1}, %{ else }.%{ endif }
  %{~ endfor ~}
  EOF
}