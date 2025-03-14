terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket83"
    key           = "terraform.tfstate"
    region        = "us-east-1"
    use_lockfile   = true
    encrypt       = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-secure-terraform-bucket4"
  acl    = "private"
}

# Add wait for 1 minute (60 seconds)
resource "time_sleep" "wait_1_minute" {
  depends_on = [aws_s3_bucket.example]
  create_duration = "60s"
}
