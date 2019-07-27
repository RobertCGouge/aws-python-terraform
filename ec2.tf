provider "aws" {
    profile = "default"
}

data "aws_ami" "al2" {
    most_recent = true

    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-x86_64-gp2"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["amazon"]
}
resource "aws_instance" "web" {
    ami           = "${data.aws_ami.al2.id}"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloWorld"
    }
}