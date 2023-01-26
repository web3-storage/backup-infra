variable "ecs_cluster_name" {
  type        = string
  description = "Name for ECS cluster, which will be used to run backup container"
}

variable "ecs_task_definition_family" {
  type        = string
  description = "Family for ECS task definition, which will be used to run backup container"
}

variable "ecs_service_name" {
  type        = string
  description = "Name for ECS service, which will be used to run backup container"
}

variable "repository_url" {
  type        = string
  description = "URL of the repository where the backup image is stored"
}

variable "backup_image_version" {
  type        = string
  description = "Version of the backup image"
}

variable "target_bucket_name" {
  type        = string
  description = "Name of the S3 bucket where the CAR files will be stored"
}

variable "concurrency" {
  type        = string
  description = "Number of concurrent CIDs to be processed"
  default     = "10"
}

variable "batch_size" {
  type        = string
  description = "Number of CIDs to be processed in a batch"
  default     = "100"
}

variable "target_bucket_policy_write_name" {
  type        = string
  description = "Name of the policy that will be attached to the ECS task execution role for write access to the target bucket"
}

variable "vpc" {
  type = object({
    name                 = string
    cidr                 = string
    private_subnets      = list(string)
    public_subnets       = list(string)
    enable_nat_gateway   = bool
    single_nat_gateway   = bool
    enable_dns_hostnames = bool
  })
  description = "VPC for ECS service"
}

variable "data_urls_map" {
  type        = set(string)
  description = "Map with URLs of source CID lists. Each of these will create a new task definition and service"
}
