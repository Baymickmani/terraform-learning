resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

data "archive_file" "lambda_code" {
  type        = "zip"
  source_dir  = "./python-code"
  output_path = "./python-code.zip"
}

resource "aws_lambda_function" "terraform-lambda" {
  function_name = "terraform-lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda.main"
  runtime       = "python3.7"
  description   = "This Lambda is being controlled by terraform"
  timeout       = 180
  environment {
    variables = {
      "createdBy"    = "terraform"
      "functionName" = "terraformLambda"
    }
  }
  tags = {
    "lambda-console:blueprint" = "hello-world-python"
    "created"                  = "terraform"
  }
  filename = data.archive_file.lambda_code.output_path
}
