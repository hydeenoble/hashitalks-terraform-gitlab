terraform {
  backend "s3" {
    bucket         = "demo-terraform.state"
    dynamodb_table = "demo-terraform-state-locking"
    region         = "us-east-1"
    key            = "app-2/terraform.tfstate"
  }
}