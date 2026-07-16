output "firs_arn" {
  value = aws_iam_user.users[0].arn
  description = "The ARN of the first user"
}

output "all_arns" {
  value = aws_iam_user.users[*].arn
  description = "The ARN of the all users"
}

output "neo_cloudwatch_policy_arn" {
  value = (
    var.give_neo_cloudwatch_full_access
    ? aws_iam_user_policy_attachment.neo_cloudwatch_full_access[0].policy_arn
    : aws_iam_user_policy_attachment.neo_cloudwatch_read_only[0].policy_arn
  )
}