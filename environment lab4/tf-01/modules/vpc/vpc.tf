resource "aws_vpc" "myvpc" {
    cidr_block = var.cidr_vpc
    enable_dns_support = true
    enable_dns_hostnames = true
    assign_generated_ipv6_cidr_block = true
    tags = { Name = "myvpc" }
}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id
    tags = { Name = "myigw" }
}

resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.my-new-pub-SN.id
  depends_on    = [aws_internet_gateway.igw]
  tags = {
    Name        = "nat"
  }
}

resource "aws_route_table" "my_pub_RT" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = var.cidr_default
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = { Name = "my_public_RT" }
}

resource "aws_route_table" "my_priv_RT" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = var.cidr_default
        gateway_id = aws_nat_gateway.nat.id
    }
    tags = { Name = "my_private_RT" }
}

resource "aws_subnet" "my-new-pub-SN" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.cidr_SN_pub
    availability_zone = var.az
    map_public_ip_on_launch = true
    tags = { Name = "my-new-pub-SN" }
}

resource "aws_subnet" "my-new-priv-SN" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.cidr_SN_priv
    availability_zone = var.az
    map_public_ip_on_launch = true
    tags = { Name = "my-new-priv-SN" }
}

resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.my-new-pub-SN.id
    route_table_id = aws_route_table.my_pub_RT.id
}

resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.my-new-priv-SN.id
    route_table_id = aws_route_table.my_priv_RT.id
}
