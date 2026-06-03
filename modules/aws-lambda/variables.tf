locals {
  aws_region = data.aws_region.current.region
  account_id = data.aws_caller_identity.current.account_id
}

variable "name" {
  type = string
}


