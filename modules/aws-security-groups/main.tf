resource "aws_security_group" "this" {
  name        = var.name
  description = "nuke test security group"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow ICMP ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
