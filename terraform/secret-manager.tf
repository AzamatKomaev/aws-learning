resource "aws_secretsmanager_secret" "xray" {
  name = "xray"
}

resource "aws_secretsmanager_secret_version" "xray" {
  secret_id     = aws_secretsmanager_secret.xray.id
  secret_string = templatefile("files/xray-config.json.tftpl", { xray_clients=var.xray_clients })
}