provider "aws" {
  default_tags {
    tags = {
      Team        = "NearForm"
      Project     = "Backup"
      Repository  = "https://github.com/web3-storage/backup-infra"
      Environment = "<%= expansion(':ENV') %>"
      Stack       = "<%= expansion(':MOD_NAME') %>"
      ManagedBy   = "Terraform"
    }
  }
}
