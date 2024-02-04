# ---------------CODEPIPELINE ROLES & ATTACHMENTS---------------------
resource "aws_iam_role" "codepipeline" {
  name               = "codepipeline_role"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "codestar_full_access" {
  role       = aws_iam_role.codepipeline.name
  policy_arn = aws_iam_policy.codestar_connections_policy.arn
}

resource "aws_iam_role_policy_attachment" "s3_access" {
  role       = aws_iam_role.codepipeline.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

resource "aws_iam_role_policy_attachment" "codepipeline_codebuild_start" {
  role       = aws_iam_role.codepipeline.name
  policy_arn = aws_iam_policy.codebuild_start.arn
}

# ---------------CODEBUILD ROLES & ATTACHMENTS---------------------
resource "aws_iam_role" "codebuild" {
  name               = "codebuild_role"
  assume_role_policy = data.aws_iam_policy_document.codebuild_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "codebuild_cloudwatch_logs" {
  role       = aws_iam_role.codebuild.name
  policy_arn = aws_iam_policy.codebuild_cloudwatch_logs.arn
}

resource "aws_iam_role_policy_attachment" "codebuild_s3_access" {
  role       = aws_iam_role.codebuild.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}