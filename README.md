# Backup Infra

This project contains code to provision Cloud infrastructure for [Backup tool](https://github.com/web3-storage/backup). 

## Pre Requisites

- [Configure AWS Access](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- Install [Terraspace](https://terraspace.cloud/docs/install/) and [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Deploy

``` sh
AWS_REGION=us-west-2 TS_ENV=prod terraspace up artifactory
AWS_REGION=us-west-2 TS_ENV=prod terraspace up log
```

Make a first **image push to registry**. Also, remember to feed source CIDs bucket list (See next topic). `ecs-cluster` up won't work before doing so.

Update `backup_image_version` (`terraspace/app/stacks/ecs-cluster/tfvars/base.tfvars`) with the image tag

``` sh
AWS_REGION=us-west-2 TS_ENV=prod terraspace up ecs-cluster
```

## Add/Remove source data files URLs

Update `data_urls_map` (`terraspace/app/stacks/ecs-cluster/tfvars/base.tfvars`) by adding a new file, or removing an existing. Then, run:

``` sh
AWS_REGION=us-west-2 TS_ENV=prod terraspace up ecs-cluster
```

## Stop

``` sh
AWS_REGION=us-west-2 TS_ENV=prod terraspace down ecs-cluster
```

CloudWatch logs are preserved for further analysis

## Stacks

- **artifactory**: ECR repository for docker image
- **ecs-cluster**: 
    - Cluster (`main.tf`)
    - One Task Definition, and one service, for each source data file URL (`main.tf`)
    - Networking (`network.tf`)
    - Access permissionning (`auth.tf`)
- **logs**: Log Group. Increase `retention_in_days` if you want to keep logs for a longer period of time. `prevent_destroy=true` makes sure this log group can't be accidentaly deleted before retention period. 

## Workflows

Currently, there isn't workflows configured for this project. Commands need to be executed from developer machine
