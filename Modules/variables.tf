variable "cidr" {
  default = "116.50.30.50/32"
}

variable "instance_name" {
  type = list
  default = ["Dev", "Staging","prod"]
}

variable "ami" { 
default = ""
}

variable "instance_type" {
    default = "t2.micro"
  }

variable "key_name" {
   default = "ohio"
}       
                      
variable "associate_public_ip_address"  {
    type = bool
    description = "(optional) describe your variable"
    default =  true
} 
 variable "instance_count"  {
    type = number
    description = "(optional) describe your variable"
    default = 3
 }  
