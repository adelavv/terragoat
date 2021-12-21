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
    git_commit           = "4a7af45ab65ba995c7796b26e4ac1c972f6fa612"
    git_file             = "terraform/simple_instance/ec21.tf"
    git_last_modified_at = "2021-12-21 13:55:55"
    git_last_modified_by = "80464597+adelavv@users.noreply.github.com"
    git_modifiers        = "80464597+adelavv"
    git_org              = "adelavv"
    git_repo             = "terragoat"
    yor_trace            = "6e63a797-641d-427e-a4c4-4ac21568f0f3"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec21"
    git_commit           = "4a7af45ab65ba995c7796b26e4ac1c972f6fa612"
    git_file             = "terraform/simple_instance/ec21.tf"
    git_last_modified_at = "2021-12-21 13:55:55"
    git_last_modified_by = "80464597+adelavv@users.noreply.github.com"
    git_modifiers        = "80464597+adelavv"
    git_org              = "adelavv"
    git_repo             = "terragoat"
    yor_trace            = "81c43d98-5f95-4f3c-89b0-abe1e6ccd760"
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
