resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.web_bucket.id
  policy = data.aws_iam_policy_document.s3_cloudfront_policy.json
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "S3AccessPolicy"
  description = "Policy for accessing the S3 bucket from CodePipeline"
  policy      = data.aws_iam_policy_document.s3_codepipeline_policy.json
}

resource "aws_iam_policy" "codestar_connections_policy" {
  name        = "CodeStarConnectionsFullAccess"
  description = "Full access to AWS CodeStar Connections"
  policy      = data.aws_iam_policy_document.codestar_connections_full_access.json
}

resource "aws_iam_policy" "codebuild_start" {
  name        = "codebuild_start"
  description = "Allows CodePipeline to start CodeBuild builds"
  policy      = data.aws_iam_policy_document.codebuild_start.json
}

resource "aws_iam_policy" "codebuild_cloudwatch_logs" {
  name        = "codebuild_cloudwatch_logs"
  description = "Allows CodeBuild to create and write to CloudWatch Logs"
  policy      = data.aws_iam_policy_document.codebuild_cloudwatch_logs.json
}