#<resource> <resouce-type><resouce-name>
resource "aws_security_group" "allow_ports" {
  Name        = "allow_ports"
  description = "Allow port 22,80,8080,3306"
  
    dynamic "ingress" {
        for_each = var.inbound_rules
        content {
          from_port        = ingress.value["port"]
          to_port          = ingress.value["port"]
          protocol         = ingress.value["protocol"]
          cidr_blocks      = ingress.value["allow_CIDR"]
          ipv6_cidr_blocks = ["::/0"]
        }
    
  }
  egress {
    from_port        = 0  #all protocol
    to_port          = 0
    protocol         = "-1"  #all protocol
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ports"
    created_by = "kiran"
  }
}