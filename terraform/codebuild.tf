resource "aws_codebuild_project" "website" {
  name          = "${var.project_name}-build"
  description   = "Builds and deploys the website"
  build_timeout = "15"
  service_role  = aws_iam_role.codebuild.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:4.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
    name  = "S3_BUCKET"
    value = aws_s3_bucket.web_bucket.bucket
    }
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/${var.github_owner}/${var.codebuild_source_location}.git"
    git_clone_depth = 1
    buildspec       = file("buildspec.yml")
  }

  tags = {
    Name = "${var.project_name}-build"
  }
}