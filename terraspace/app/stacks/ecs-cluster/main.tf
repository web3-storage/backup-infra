terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0.0"
}

resource "aws_cloudwatch_log_group" "backup" {
  name = var.ecs_cluster_name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_ecs_cluster" "backup" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "backup" {
  for_each                 = var.data_urls_map
  family                   = var.ecs_task_definition_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 2048
  memory                   = 4096
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
    {
      name        = "backup"
      image       = "${var.repository_url}:${var.backup_image_version}"
      cpu         = 2048
      memory      = 4096
      networkMode = "awsvpc",
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.backup.name
          "awslogs-region"        = local.region
          "awslogs-stream-prefix" = "backup"
        }
      }
      environment = flatten([
        { "name" : "DATA_URL", "value" : each.value },
        { "name" : "S3_REGION", "value" : local.region },
        { "name" : "S3_BUCKET_NAME", "value" : var.target_bucket_name },
        { "name" : "CONCURRENCY", "value" : var.concurrency },
        { "name" : "BATCH_SIZE", "value" : var.batch_size },
      var.debug ? [{ "name" : "DEBUG", "value" : "*" }] : []])
    },
  ])
  ephemeral_storage {
    size_in_gib = 200
  }
}

resource "aws_ecs_service" "backup" {
  for_each        = aws_ecs_task_definition.backup
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.backup.id
  task_definition = each.value.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    assign_public_ip = false
    security_groups  = [module.vpc.default_vpc_default_security_group_id]
    subnets          = module.vpc.private_subnets
  }
}
