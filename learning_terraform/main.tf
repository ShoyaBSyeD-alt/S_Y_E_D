provider "aws" {
    region = "us-east-1"
    AWS_ACCESS_KEY_ID = "access-key"
    AWS_SECRET_ACCESS_KEY = "your-secret-key"
}

resource "aws_instance" "test" {
    ami = "ami-0150ccaf51ab55a51"
    type = "t2.micro"
}