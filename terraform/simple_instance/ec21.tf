provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "34f1956f1c33bd0fbfdc8a535a71e26a2bba518e"
    git_file             = "terraform/simple_instance/ec21.tf"
    git_last_modified_at = "2021-12-21 13:59:45"
    git_last_modified_by = "80464597+adelavv@users.noreply.github.com"
    git_modifiers        = "80464597+adelavv"
    git_org              = "adelavv"
    git_repo             = "terragoat"
    yor_trace            = "01a3e07c-1591-446e-ac6b-b7501adaca42"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec21"
    git_commit           = "34f1956f1c33bd0fbfdc8a535a71e26a2bba518e"
    git_file             = "terraform/simple_instance/ec21.tf"
    git_last_modified_at = "2021-12-21 13:59:45"
    git_last_modified_by = "80464597+adelavv@users.noreply.github.com"
    git_modifiers        = "80464597+adelavv"
    git_org              = "adelavv"
    git_repo             = "terragoat"
    yor_trace            = "fc6686b2-0296-474d-afb1-9aacf65dabd4"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
