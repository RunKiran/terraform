#<resource> <resouce-type><resouce-name>
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic and all outbound traffic"
  
    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0  #all protocol
    to_port          = 0
    protocol         = "-1"  #all protocol
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
    created_by = "kiran"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-090252cbe067a9e58"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id]

  tags = {
    Name = "DB"
  }
}