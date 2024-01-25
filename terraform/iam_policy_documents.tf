data "aws_iam_policy_document" "s3_cloudfront_policy" {
  statement {

    sid       = "AllowCloudFrontServicePrincipalReadOnly"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web_bucket.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.s3_distribution.arn]
    }
  }
}

data "aws_iam_policy_document" "codebuild_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "codepipeline_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "codestar_connections_full_access" {
  statement {
    actions = ["codestar-connections:*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "s3_codepipeline_policy" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      "${aws_s3_bucket.codepipeline.arn}/*"]
  }
}

data "aws_iam_policy_document" "codebuild_start" {
  statement {
    actions   = ["codebuild:StartBuild","codebuild:BatchGetBuilds"]
    resources = [aws_codebuild_project.website.arn]
  }
}

data "aws_iam_policy_document" "codebuild_cloudwatch_logs" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = ["arn:aws:logs:*:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/*"]
  }
}