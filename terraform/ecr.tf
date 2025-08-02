resource "aws_ecr_repository" "hello_app" {
  name                 = "hello-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

