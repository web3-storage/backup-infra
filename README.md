# Backup Infra

This project contains code to provision Cloud infrastructure for [Backup tool](https://github.com/web3-storage/backup).

## Deploy

``` sh
AWS_REGION=us-west-2 TS_ENV=prod terraspace all up
```

## Add/Remove source data files URLs

## Stop It

``` sh
AWS_REGION=us-west-2 TS_ENV=prod terraspace down ecs-cluster
```

## Stacks

- **Logs**: Increase `retention_in_days` if you want to keep logs for a longer period of time. `prevent_destroy=true` makes sure this log group can't be accidentaly deleted before retention period. 

## Workflows

Currently, there isn't workflows configured for this project. Commands need to be executed from developer machine



