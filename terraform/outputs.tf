output "account_id" {
  description = "The AWS Account ID number of the account that owns or contains the calling entity"
  value       = data.aws_caller_identity.current.account_id
}