output "firs_arn" {
  value = aws_iam_user.users[0].arn
  description = "The ARN of the first user"
}

output "all_arns" {
  value = aws_iam_user.users[*].arn
  description = "The ARN of the all users"
}