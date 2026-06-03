module "lambda" {
  source   = "./modules/aws-lambda"
  for_each = toset([for i in range(1, 11) : tostring(i)])
  name     = "${var.lambda_function_name}-${each.value}"
}

module "s3" {
  source   = "./modules/aws-s3"
  for_each = toset([for i in range(1, 11) : tostring(i)])
  name     = "${var.s3_bucket_name}-${each.value}"
}

module "ssm_parameter" {
  source   = "./modules/aws-ssm-parameters"
  for_each = toset([for i in range(1, 11) : tostring(i)])
  name     = "${var.ssm_parameter_name}-${each.value}"
  value    = "nuke-test"
}

module "iam" {
  source      = "./modules/aws-iam"
  for_each    = toset([for i in range(1, 11) : tostring(i)])
  role_name   = "${var.iam_role_name}-${each.value}"
  policy_name = "${var.iam_policy_name}-${each.value}"
}

module "dynamodb" {
  source   = "./modules/aws-dynamodb"
  for_each = toset([for i in range(1, 11) : tostring(i)])
  name     = "${var.dynamodb_table_name}-${each.value}"
}

module "security_group" {
  source   = "./modules/aws-security-groups"
  for_each = toset([for i in range(1, 11) : tostring(i)])
  name     = "${var.sg_name}-${each.value}"
  vpc_id   = data.aws_vpc.default.id
}

module "cloudwatch_log_group" {
  source   = "./modules/aws-cloudwatch-log-groups"
  for_each = toset([for i in range(1, 11) : tostring(i)])
  name     = "${var.cw_log_group_name}-${each.value}"
}

module "sns" {
  source   = "./modules/aws-sns"
  for_each = toset([for i in range(1, 11) : tostring(i)])
  name     = "${var.sns_topic_name}-${each.value}"
}

module "sqs" {
  source   = "./modules/aws-sqs"
  for_each = toset([for i in range(1, 11) : tostring(i)])
  name     = "${var.sqs_queue_name}-${each.value}"
}

module "secrets_manager" {
  source       = "./modules/aws-secrets-manager-secrets"
  for_each     = toset([for i in range(1, 11) : tostring(i)])
  name         = "${var.secrets_manager_name}-${each.value}"
  secret_value = "nuke-test"
}
