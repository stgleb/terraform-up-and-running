provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "example" {
    ami = "ami-be7753db"
    instance_type = "t2.micro"
}