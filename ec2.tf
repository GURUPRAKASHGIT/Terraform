locals {
  common_tags = {
    Owner = "DevOps Team"
    service = "backend"
  }
}

resource "aws_instance" "app-dev" {
   ami = var.OS_id
   instance_type = var.instance_type
   key_name = var.key_paire
   tags = local.common_tags
   count = 3
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = var.az
  size              = var.ebs_size
  tags = local.common_tags
}

resource "aws_instance" "webinstance" {
   ami = var.Os_id
   instance_type = var.instance_type
   count = 3
  tags = "Instance-${var.instance_name[count.index]}"
}
