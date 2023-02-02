resource "aws_cloudwatch_log_group" "backup" {
  name = var.log_group_name

  lifecycle {
    prevent_destroy = true
  }
}
