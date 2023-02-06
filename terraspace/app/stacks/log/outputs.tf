output "log_group_name" {
  value = aws_cloudwatch_log_group.backup.name
  description = "Name of the log group"
}
