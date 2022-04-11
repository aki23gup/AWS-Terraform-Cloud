output "vpc_id" {
  description = "VPC ID"
  value = aws_vpc.myvpc.id
}

output "public_SN_id" {
  description = "Public Subnet ID"
  value = aws_subnet.my-new-pub-SN.id
}

output "private_SN_id" {
  description = "Private Subnet ID"
  value = aws_subnet.my-new-priv-SN.id
}