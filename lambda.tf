data "archive_file" "lambda_zip_inline" {
  type        = "zip"
  output_path = "lambda_function_payload.zip"
  source {
    content  = <<EOF
module.exports.handler = async (event, context, callback) => {
	const what = "world";
	const response = `Hello $${what}!`;
	callback(null, response);
};
EOF
    filename = "main.js"
  }
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda_function_payload.zip"
  function_name = "inline_lambda_function"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "main.handler"

  source_code_hash = data.archive_file.lambda_zip_inline.output_base64sha256

  runtime = "nodejs12.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
    