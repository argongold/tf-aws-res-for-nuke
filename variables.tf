locals {
  region     = data.aws_region.current.region
  account_id = data.aws_caller_identity.current.account_id
}

variable "aws_region" {
  description = "aws default region"
  type        = string
}

variable "resource_count" {
  description = "number of each resource type to create"
  type        = number
  default     = 10
}

variable "lambda_function_name" {
  description = "base name for lambda functions"
  type        = string
}

variable "s3_bucket_name" {
  description = "base name for s3 buckets"
  type        = string
}

variable "ssm_parameter_name" {
  description = "base name for ssm parameters"
  type        = string
}

variable "iam_role_name" {
  description = "base name for iam roles"
  type        = string
}

variable "iam_policy_name" {
  description = "base name for iam policies"
  type        = string
}

variable "dynamodb_table_name" {
  description = "base name for dynamodb tables"
  type        = string
}

variable "sg_name" {
  description = "base name for security groups"
  type        = string
}

variable "cw_log_group_name" {
  description = "base name for cloudwatch log groups"
  type        = string
}

variable "sns_topic_name" {
  description = "base name for sns topics"
  type        = string
}

variable "sqs_queue_name" {
  description = "base name for sqs queues"
  type        = string
}

variable "secrets_manager_name" {
  description = "base name for secrets manager secrets"
  type        = string
}