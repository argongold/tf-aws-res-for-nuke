data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_availability_zones" "available" {}

resource "random_id" "this" {
  byte_length = 4
}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "nuke-test-vpc-${random_id.this.hex}"
  }
}


