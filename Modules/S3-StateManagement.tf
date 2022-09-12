
provider "aws"
{
  access_key = ""
  secret_key = ""
  region     = "us-east-2"
}

required _providers{
  aws={
     source="hashicorp/aws"
     version="~4.0"
  }
}


resource "aws_s3_bucket" "bucket6685" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "dynamodb6685" "terraform_state_lock" {
  name           = "terraform-lock"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket"
    key = "Dev/terraform"
    region = "us-east-2"
    dynamodb_table = "terraform-lock"
  }
}
}