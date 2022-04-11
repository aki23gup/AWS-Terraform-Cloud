variable "cidr_vpc" {
  description = "CIDR block for VPC"
  type = string
  default = "100.64.0.0/16"
}

variable "cidr_default" {
  description = "Default cidr block 0.0.0.0/0"
  type = string
  default = "0.0.0.0/0"
}

variable "cidr_SN_pub" {
  description = "CIDR block for Publid Subnet"
  type = string
  default = "100.64.1.0/24"
}

variable "cidr_SN_priv" {
  description = "CIDR block for Private Subnet"
  type = string
  default = "100.64.2.0/24"
}

variable "az" {
  description = "Availability zone"
  type = string
  default = "us-east-1a"
}
