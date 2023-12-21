provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instace" "windows_free_instance" {
  ami            = "ami-0c1e9ce55ec62e2a3"
  instance_type  = "t2_micro"
  key_name       = "free-windows-server"
  security_group = ["${aws_security_group.allow_rdp.name}"]
}


resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "Allows RDP traffic to the windows server"

  ingress = {
    from_port = 3389 #This is the port Windows server listens on TCP port for RDP
    to_port   = 3389
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}
