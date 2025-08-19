resource "aws_instance" "test" {
    ami = var.ami
    key_name = var.key
    instance_type = "t2.micro"

    user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install nginx -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
                echo "<h1>Terraform EC2 Instance with NGINX</h1>" > /var/www/html/index.html
            EOF
    tags = {
        Name = "TF demo1"
    }
}
resource "aws_security_group" "nginx_sg" {
  name        = "nginx-security-group"
  description = "Allow HTTP traffic"
  vpc_id      = var.vpc_id 

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-sg"
  }
}


variable "ami" {
    description = "our instance ami"
    type = string
    default = "ami-0150ccaf51ab55a51"
}

variable "key" {
    description = "adding the key pair"
    type = string
    default = "my_key"
}