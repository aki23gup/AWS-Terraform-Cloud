variable "vpcid" {
  description = "ID of the VPC in which security resources are deployed"
  type = string
}

variable "ssh" {
  description = "Port number for ssh security group"
  type = number
  default = 22
}

variable "http" {
  description = "Port number for http security group"
  type = number
  default = 8080
}

variable "protocol_type_ssh" {
  description = "Protocol type for security group rule"
  type = string
  default = "tcp"
}

variable "cidr_default" {
  description = "Default cidr block 0.0.0.0/0"
  type = list
  default = ["0.0.0.0/0"]
}

variable "egress_port" {
  description = "Egress from/to port for security groups"
  type = number
  default = 0
}