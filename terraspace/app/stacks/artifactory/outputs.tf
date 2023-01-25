output "repository_url" {
  value = aws_ecr_repository.backup.repository_url
  description = "URL for ECR repo. We use this to store backup docker image"
}
