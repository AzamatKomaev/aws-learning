output "s3_rw_access_access_key" {
  value = aws_iam_access_key.s3_rw_access.id
}

output "s3_rw_access_secret_key" {
  value = aws_iam_access_key.s3_rw_access.secret
  sensitive = true 
}

output "nginx_lb_demo_public_ip" {
 value = length(aws_instance.nginx_lb_demo) > 0 ? aws_instance.nginx_lb_demo[0].public_ip : 0
}
