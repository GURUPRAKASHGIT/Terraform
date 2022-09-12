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
  associate_public_ip_address = var.associate_public_ip_address
  count                       = var.instance_count
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = var.az
  size              = var.ebs_size
  tags = local.common_tags
}

/*  ## Existing instance update
resource "aws_instance" "webinstance" {
     ami = var.OS_id
   instance_type = var.instance_type
   key_name = var.key_paire
  associate_public_ip_address = var.associate_public_ip_address
  count                       = var.instance_count
  tags = "Instance-${var.instance_name[count.index]}"
}
*/

  
## terraform import aws_instace.webinstance instance_id

