#<resource> <resouce-type><resouce-name>
resource "aws_security_group" "allow_ssh" {
  name        = var.sg_name
  description =  var.sg_discription
  
  #block
    ingress {
    from_port        = var.allow_port
    to_port          = var.allow_port
    protocol         = var.allow_protocol
    cidr_blocks      = var.allow_CIDR
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0  #all protocol
    to_port          = 0
    protocol         = "-1"  #all protocol
    cidr_blocks      = var.allow_CIDR
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags
    
}

resource "aws_instance" "DB" {
  ami           = var.image_id
  instance_type = var.instance_type
  #count = 3
  count = length(var.instance_names)

  tags = {
    Name = var.instance_names[count.index]
    date = "today"
    created_by = "kiran"
  }
}

 
