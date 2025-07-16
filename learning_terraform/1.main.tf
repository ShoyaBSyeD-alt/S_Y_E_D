resource "aws_instance" "test" {
    ami = var.ami
    key_name = var.keys
    instance_type = "t2.micro"

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