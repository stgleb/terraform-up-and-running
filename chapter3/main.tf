terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "us-east-2"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket         = "terraform.bucket.name"
    key            = "path/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform_lock"
    encrypt        = true
  }
}

resource "aws_instance" "example2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
}
