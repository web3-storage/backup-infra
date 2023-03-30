# Backup Infra

This project contains code to provision Cloud infrastructure for [Backup tool](https://github.com/web3-storage/backup). 

## Pre Requisites

- [Configure AWS Access](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- Install [Terraspace](https://terraspace.cloud/docs/install/) and [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Stacks

- **artifactory**: ECR repository for docker image
- **ecs-cluster**: 
    - Cluster (`main.tf`)
    - One Task Definition, and one service, for each source data file URL (`main.tf`)
    - Networking (`network.tf`)
    - Access permissionning (`auth.tf`)
- **logs**: Log Group. Increase `retention_in_days` if you want to keep logs for a longer period of time. `prevent_destroy=true` makes sure this log group can't be accidentaly deleted before retention period

## Deploy

``` sh
AWS_REGION=us-west-2 TS_ENV=prod terraspace up artifactory
AWS_REGION=us-west-2 TS_ENV=prod terraspace up log
```

Make a first **image push to registry**. Also, remember to feed source CIDs bucket list (See next topic). `terraspace up ecs-cluster` won't work before doing so

Merge a PR to main in https://github.com/web3-storage/backup and an updated docker image is built and pushed to a private ECR repository with the tag format `${iso-date}-${short-commit-sha}`. 

Grab that new tag name from the workflow run (or check the ECR listing in aws console) and update `backup_image_version` in `terraspace/app/stacks/ecs-cluster/tfvars/base.tfvars`, then run `terraspace up ecs-cluster`

``` sh
AWS_REGION=us-west-2 TS_ENV=prod terraspace up ecs-cluster
```

## Add/Remove source data files URLs

Update `data_urls_map` (`terraspace/app/stacks/ecs-cluster/tfvars/base.tfvars`) by adding a new file, or removing an existing, to/from set. Then, run:

``` sh
AWS_REGION=us-west-2 TS_ENV=prod terraspace up ecs-cluster
```

## Stop

``` sh
AWS_REGION=us-west-2 TS_ENV=prod terraspace down ecs-cluster
```

CloudWatch logs are preserved for further analysis


## Workflows

Currently, there isn't workflows configured for this project. Commands need to be executed from developer machine

## Troubleshooting

### Error acquiring the state lock

Don't `ctrl+c` a terraspace command. You'll have claimed the lock, and it doesn't gracefully handle a kill signal, and now you've snapped the key off line lock and subsequent commands will fail with a:

```
AWS_REGION=us-west-2 TS_ENV=prod terraspace all plan
...
terraspace plan artifactory:  │ Error: Error acquiring the state lock
terraspace plan log:  │ Error: Error acquiring the state lock
```

To fix it, go to the dynamo db explorer, find the ID of the stack that are failing 

![screenshot showing lock id in dynamo db](https://bafybeigx5w6kctovp6n4jemzgdht7iwsbdqceunz7qkwmfne6rt5nk4kim.ipfs.w3s.link/Screenshot%202023-03-30%20at%2014.16.10.png)


and run `terraspace force_unlock <stack> <id>` to free the lock. You may have to do this for multple stack'n'lock combos.

```
# e.g.
AWS_REGION=us-west-2 TS_ENV=prod terraspace force_unlock artifactory 689fa081-b637...
```
