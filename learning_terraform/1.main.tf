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