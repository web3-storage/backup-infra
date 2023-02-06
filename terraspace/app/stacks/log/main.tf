resource "aws_cloudwatch_log_group" "backup" {
  name = var.log_group_name
  retention_in_days = 60

  lifecycle {
    prevent_destroy = true
  }
}
