provider "aws" {
    profile = "default"
    alias = "Jenkins"
}

data "aws_ami" "al2" {
    most_recent = true

    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-*x86_64-gp2"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["amazon"]
}
resource "aws_instance" "Jenkins" {
    ami           = "${data.aws_ami.al2.id}"
    instance_type = "t2.micro"
    key_name = "securitylaptop"
    user_data = <<-EOF
        #!/bin/bash
        yum update -y
        yum upgrade -y
        yum remove java-1.7.0-openjdk
        yum install java-1.8.0
        rpm — import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
        yum install jenkins -y
        systemctl start jenkins.service
        systemctl enable jenkins.service
        EOF

    tags = {
        Name = "Jenkins"
    }
}