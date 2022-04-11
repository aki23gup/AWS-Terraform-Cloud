variable "public_SN_id" {
  description = "ID of the Public Subnet in which security resources are deployed"
  type = string
}

variable "private_SN_id" {
  description = "ID of the Private Subnet in which security resources are deployed"
  type = string
}

variable "sg_id" {
  description = "ID of the Security Group in which security resources are deployed"
  type = string
}

variable "ami" {
  description = "AMI number"
  type = string
  default = "ami-0c02fb55956c7d316"
}