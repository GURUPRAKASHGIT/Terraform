locals {
  common_tags = {
    Owner = "DevOps Team"
    service = "backend"
  }
}

resource "aws_instance" "app-dev" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   key_name = "ec2-key"
   tags = local.common_tags
  count = 3
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "us-east-2c"
  size              = 8
  tags = local.common_tags
}

resource "aws_instance" "webinstance" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = var.instance_type
   count = 3
  tags = var.instance_name[count.index]
}
