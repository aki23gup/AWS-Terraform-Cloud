
resource "aws_instance" "ec2-docker-public" {
    ami = "ami-0c02fb55956c7d316"
    instance_type = "t2.micro"
    subnet_id = var.public_SN_id
    security_groups = [var.sg_id]
    key_name = "Lab1Key"
    
    tags = { Name = "tf-ec2-public" }
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install docker -y
                systemctl start docker
                sudo usermod -aG docker ec2-user
                docker run -p 8080:80 nginx
                EOF
}

resource "aws_instance" "ec2-docker-private" {
    ami = "ami-0c02fb55956c7d316"
    instance_type = "t2.micro"
    subnet_id = var.private_SN_id
    security_groups = [var.sg_id]
    key_name = "Lab1Key"
    
    tags = { Name = "tf-ec2-private" }
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install docker -y
                systemctl start docker
                sudo usermod -aG docker ec2-user
                docker run -p 8080:80 nginx
                EOF
}