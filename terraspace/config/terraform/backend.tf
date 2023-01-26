terraform {
  backend "s3" {
    bucket         = "<%= expansion('backup-ipfs-cluster-state-:ACCOUNT-:REGION') %>"
    key            = "<%= expansion(':REGION/:ENV/:BUILD_DIR/terraform.tfstate') %>"
    region         = "<%= expansion(':REGION') %>"
    encrypt        = true
    dynamodb_table = "backup-ipfs-cluster-state-lock"
  }
}
