provider "aws" {
region = "us-east-1"
access_key = "your access key"
secret_key = "your secret key"
}

resource "aws_instance" "test" {
   ami = "ami-0150ccaf51ab55a51"
   instance_type = "t2.micro"
   
   tags {
   name = "Terraform EC2"
   }
}

