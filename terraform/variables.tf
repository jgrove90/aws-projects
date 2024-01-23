variable "aws_region" {
  description = "AWS region for the infrastructure"
  type        = string
  default     = "us-east-2"
}

variable "s3_web_bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "static-website"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "static-website"
}

variable "domain_name" {
  description = "Domain name"
  type        = string
  default     = "jhome.dev"
}


variable "cloudflare_api_token" {
  description = "Cloudflare api token"
  type        = string
  default     = "<your_api_key>"
}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone id"
  type        = string
  default     = "<your_zone_id>"
}

variable "cloudflare_domain_name" {
  description = "Cloudflare domain name"
  type        = string
  default     = "static"
}
