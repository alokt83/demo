terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket83"
    key           = "terraform.tfstate"
    region        = "us-east-1"
    use_lockfile   = true
    dynamodb_table = "terraform-lock"
    encrypt       = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-secure-terraform-bucket10"
  acl    = "private"
}


