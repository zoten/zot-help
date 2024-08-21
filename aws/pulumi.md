# Pulumi + AWS

## State bucket


A state bucket refers to an Amazon S3 bucket that is used to store the state of your infrastructure managed by Pulumi.

 * State Bucket: The state bucket is an Amazon S3 bucket where Pulumi stores this state file. This file is crucial because it contains all the details about the resources you've created, including their configurations and dependencies.
 * Locking: Pulumi can use DynamoDB in conjunction with an S3 state bucket to provide state locking and consistency, preventing multiple simultaneous updates from corrupting the state file.

### Configure state bucket 

``` bash
pulumi config set pulumi:s3://<bucket-name>/pulumi-state
```

### Connect to state bucket

``` bash
pulumi login s3://<bucket-name>/pulumi-state
```
