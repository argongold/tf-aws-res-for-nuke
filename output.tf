output "lambda_function_names" {
  value = [for k, v in module.lambda : v.function_arn]
}

output "s3_bucket_names" {
  value = [for k, v in module.s3 : v.bucket_name]
}

output "ssm_parameter_names" {
  value = [for k, v in module.ssm_parameter : v.parameter_name]
}

output "iam_role_names" {
  value = [for k, v in module.iam : v.role_name]
}

output "iam_policy_names" {
  value = [for k, v in module.iam : v.policy_name]
}

output "dynamodb_table_names" {
  value = [for k, v in module.dynamodb : v.table_name]
}

output "security_group_ids" {
  value = [for k, v in module.security_group : v.security_group_id]
}

output "cloudwatch_log_group_names" {
  value = [for k, v in module.cloudwatch_log_group : v.log_group_name]
}

output "sns_topic_arns" {
  value = [for k, v in module.sns : v.topic_arn]
}

output "sqs_queue_urls" {
  value = [for k, v in module.sqs : v.queue_url]
}

output "secrets_manager_names" {
  value = [for k, v in module.secrets_manager : v.secret_name]
}
