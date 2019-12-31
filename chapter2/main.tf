provider "aws" {
    region = "us-east-2"
}

resource "aws_security_group" "instance" {
    name = "terraform-example"

    ingress {
        from_port = 8080
        protocol = "tcp"
        to_port = 8080
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "terraform-example"
    }
}

resource "aws_instance" "example" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]

    tags = {
        Name = "terraform-example"
    }
}

output "public_ip" {
    value = aws_instance.example.public_ip
    description = "public ip of aws instance"
}
