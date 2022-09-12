
provider "aws"
{
  region     = "us-east-2"
}

required _providers{
  aws={
     source="hashicorp/aws"
     version="~> 4.0"
  }
}


resource "aws_s3_bucket" "bucketshouldbeunique22" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_dynamo_db_table" "terraform-state-lock" {
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
    key = "Dev/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-state-lock"
  }
}
}
