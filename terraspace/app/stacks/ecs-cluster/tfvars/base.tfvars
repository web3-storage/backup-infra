backup_image_version            = "2023-03-31-a84d1d75"
target_bucket_name              = "dotstorage-prod-1"
target_bucket_policy_write_name = "<%= expansion(':ENV') %>-dotstorage-prod-1-write"
ecs_cluster_name                = "<%= expansion(':ENV') %>-backup-ipfs-cluster"
log_group_name                  = <%= output('log.log_group_name', mock: '') %>
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
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-0.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-1.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-3.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-4.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-6.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-8.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-10.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-18.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-19.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-22.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-25.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-27.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-28.json",
  "https://bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm.ipfs.w3s.link/ipfs/bafybeiha7xoedojqjz6ghxdtbf7yx2eklwo7db36772u3odrjusqck3ljm/nft-30.json",
  "https://bafybeidc4ij3jlwlvfxtwcqmfjqafvhokmj3ecqjq7k2derv2w355porii.ipfs.w3s.link/ipfs/bafybeidc4ij3jlwlvfxtwcqmfjqafvhokmj3ecqjq7k2derv2w355porii/web3-0.json",
  "https://bafybeidc4ij3jlwlvfxtwcqmfjqafvhokmj3ecqjq7k2derv2w355porii.ipfs.w3s.link/ipfs/bafybeidc4ij3jlwlvfxtwcqmfjqafvhokmj3ecqjq7k2derv2w355porii/web3-1.json",
  "https://bafybeidc4ij3jlwlvfxtwcqmfjqafvhokmj3ecqjq7k2derv2w355porii.ipfs.w3s.link/ipfs/bafybeidc4ij3jlwlvfxtwcqmfjqafvhokmj3ecqjq7k2derv2w355porii/web3-2.json",
  "https://bafybeidc4ij3jlwlvfxtwcqmfjqafvhokmj3ecqjq7k2derv2w355porii.ipfs.w3s.link/ipfs/bafybeidc4ij3jlwlvfxtwcqmfjqafvhokmj3ecqjq7k2derv2w355porii/web3-3.json",
  "https://bafybeidc4ij3jlwlvfxtwcqmfjqafvhokmj3ecqjq7k2derv2w355porii.ipfs.w3s.link/ipfs/bafybeidc4ij3jlwlvfxtwcqmfjqafvhokmj3ecqjq7k2derv2w355porii/web3-4.json"
]
debug = true
