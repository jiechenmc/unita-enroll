resource "aws_dynamodb_table" "clinc_table" {
  name           = var.clinc_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "CustomerID"

  attribute {
    name = "CustomerID"
    type = "N"
  }

  tags = {
    clinc = var.clinc_name
  }

}
