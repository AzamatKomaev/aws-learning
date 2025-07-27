resource "aws_iam_user" "s3_rw_access" {
  name                 = "s3_rw_access"
  path                 = "/"
  tags = {
    AKIA2S2Y4HDCZCXYB7VA = "github actions repo"
  }
  tags_all = {
    AKIA2S2Y4HDCZCXYB7VA = "github actions repo"
  }
}

resource "aws_iam_user_policy_attachment" "s3_rw_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  user       = "s3_rw_access"
}

resource "aws_iam_access_key" "s3_rw_access" {
  user = aws_iam_user.s3_rw_access.name
}
