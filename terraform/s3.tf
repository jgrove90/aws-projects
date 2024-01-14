resource "random_integer" "three_digits" {
  min = 100
  max = 999
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "${var.s3_bucket_name}-${random_integer.three_digits.result}"
  block_public_acls = true
  website = {
    index_document = "index.html"
    error_document = "error.html"
  }
  tags = {
    Environment = "dev"
    Project = var.project_name
  }
}

# Upload static website files to S3 bucket
resource "aws_s3_object" "website_content" {
  for_each = fileset("../website", "**/*")
  bucket = module.s3_bucket.s3_bucket_id
  key    = "website/${each.key}"
  source = "../website/${each.key}"
}