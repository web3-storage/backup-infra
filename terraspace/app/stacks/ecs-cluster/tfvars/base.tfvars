backup_image_version            = "0.1"
target_bucket_name              = "dotstorage-prod-1"
target_bucket_policy_write_name = "<%= expansion(':ENV') %>-dotstorage-prod-1-write"
ecs_cluster_name                = "<%= expansion(':ENV') %>-backup-ipfs-cluster"
ecs_task_definition_family      = "backup-ipfs"
ecs_service_name                = "backup-ipfs"
repository_url                  = <%= output('artifactory.repository_url', mock: '') %>
vpc = {
  name                 = "<%= expansion(':ENV') %>-backup-ipfs-cluster"
  cidr                 = "10.5.0.0/16"
  public_subnets       = ["10.5.1.0/24", "10.5.2.0/24"]
  private_subnets      = ["10.5.3.0/24", "10.5.4.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
}
data_urls_map = [
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-0.json"
]
