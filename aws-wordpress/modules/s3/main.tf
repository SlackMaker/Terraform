resource "aws_s3_bucket" "terraform_state" {
  bucket = "devs2blu2025"
}

resource "aws_s3_bucket_acl" "terraform_state_acl" {
  bucket = aws_s3_bucket.terraform_state.bucket
  acl    = "private"
}
