backup_image_version            = "2023-05-02-b5493f3c"
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
  "https://w3s.link/ipfs/bafybeidrqq76qsyjnaj3het2vcuhuwebfkgd76hoonavrlhpvihpzlvyse/nft-0.json",
  "https://w3s.link/ipfs/bafybeidrqq76qsyjnaj3het2vcuhuwebfkgd76hoonavrlhpvihpzlvyse/nft-1.json",
  "https://w3s.link/ipfs/bafybeidrqq76qsyjnaj3het2vcuhuwebfkgd76hoonavrlhpvihpzlvyse/nft-2.json",
  "https://w3s.link/ipfs/bafybeidrqq76qsyjnaj3het2vcuhuwebfkgd76hoonavrlhpvihpzlvyse/nft-3.json",
  "https://w3s.link/ipfs/bafybeidrqq76qsyjnaj3het2vcuhuwebfkgd76hoonavrlhpvihpzlvyse/nft-4.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-0.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-1.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-2.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-3.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-4.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-5.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-6.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-7.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-8.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-9.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-10.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-11.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-12.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-13.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-14.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-15.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-16.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-17.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-18.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-19.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-20.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-21.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-22.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-23.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-24.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-25.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-26.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-27.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-28.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-29.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-30.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-31.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-32.json",
  "https://w3s.link/ipfs/bafybeib37aas7aef2g7gi73fhhezfxtvcum3shoppgduokxqkpn4vdfw2a/web3-33.json"
]
debug = true
