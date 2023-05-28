resource "aws_s3_bucket" "el_canon" {
  bucket = local.s3-sufix
}
