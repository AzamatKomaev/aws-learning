output "s3_rw_access_access_key" {
  value = aws_iam_access_key.s3_rw_access.id
}

output "s3_rw_access_secret_key" {
  value = aws_iam_access_key.s3_rw_access.secret
  sensitive = true 
}