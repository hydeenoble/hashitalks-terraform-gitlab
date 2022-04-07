resource "aws_dynamodb_table" "dynamodb_table" {
  name         = "${local.application}-${terraform.workspace}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "UserId"
  range_key    = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  tags = merge({ Name = "${local.application}-${terraform.workspace}" }, var.tags)
}