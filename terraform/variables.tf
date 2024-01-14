variable "aws_region" {
  description = "AWS region for the infrastructure"
  type        = string
  default     = "us-west-2"
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "my-static-website"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "static-website"
}