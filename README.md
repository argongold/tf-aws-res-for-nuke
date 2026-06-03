# TF-AWS-RESOURCES-FOR-NUKE

Terraform project to create ~100 miscellaneous AWS resources in eu-west-1 for aws-nuke testing.

## Resources Created (10 of each)

| Module | Resource | Naming Pattern |
|--------|----------|----------------|
| aws-lambda | Lambda Functions + IAM Roles | nuke-test-lambda-{1-10} |
| aws-s3 | S3 Buckets + Bucket Policies | nuke-test-bucket-{1-10} |
| aws-ssm-parameters | SSM Parameters | nuke-test-ssm-parameter-{1-10} |
| aws-iam | IAM Roles + Policies | nuke-test-role-{1-10} / nuke-test-policy-{1-10} |
| aws-dynamodb | DynamoDB Tables | nuke-test-dynamodb-table-{1-10} |
| aws-security-groups | Security Groups | nuke-test-sg-{1-10} |
| aws-cloudwatch-log-groups | CloudWatch Log Groups | nuke-test-cwlog-group-{1-10} |
| aws-sns | SNS Topics | nuke-test-sns-topic-{1-10} |
| aws-sqs | SQS Queues | nuke-test-sqs-{1-10} |
| aws-secrets-manager-secrets | Secrets Manager Secrets | nuke-test-secrets-manager-{1-10} |

## Usage

```bash
# Initialise Terraform with backend config
make init env=dev

# Validate syntax
make validate

# Format code
make fmt

# Plan changes
make plan env=dev

# Apply the plan
make apply

# Destroy all resources
make destroy env=dev
```
