resource "aws_instance" "vpn_access" {
  ami                         = var.vpn_access_ami_id
  associate_public_ip_address = true
  availability_zone           = aws_default_subnet.default_a.availability_zone
  instance_type               = "t2.micro"
  key_name                    = "vpn_access"
  private_ip                  = var.vpn_access_private_ip
  subnet_id                   = aws_default_subnet.default_a.id
  tenancy                     = "default"
  vpc_security_group_ids      = [aws_default_security_group.default.id]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    core_count       = 1
    threads_per_core = 1
  }
  credit_specification {
    cpu_credits = "standard"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    throughput            = 125
    volume_size           = 30
    volume_type           = "gp3"
  }
}
