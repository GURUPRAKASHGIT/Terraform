variable "cidr" {
  default = "116.50.30.50/32"
}

variable "instance_name" {
  type = list
  default = ["Dev", "Staging","prod"]
}
