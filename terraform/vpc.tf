resource "aws_default_vpc" "default" {
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_default_subnet" "default_a" {
  availability_zone                   = "eu-central-1a"
  map_public_ip_on_launch             = true
  private_dns_hostname_type_on_launch = "ip-name"
}

resource "aws_default_subnet" "default_b" {
  availability_zone                   = "eu-central-1b"
  map_public_ip_on_launch             = true
  private_dns_hostname_type_on_launch = "ip-name"
}

resource "aws_default_subnet" "default_c" {
  availability_zone                   = "eu-central-1c"
  map_public_ip_on_launch             = true
  private_dns_hostname_type_on_launch = "ip-name"
}

resource "aws_default_security_group" "default" {
  vpc_id                 = aws_default_vpc.default.id

  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    to_port          = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    to_port          = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = true
  }]
}

