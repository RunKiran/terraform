resource "aws_security_group" "allow_expense" {
  name        = var.sg_name
  description = var.sg_discription
  

  tags = {
    Name = "allow_expense"
    created_by = "kiran"
  }
  

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

 ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


resource "aws_instance" "expense" {
    ami                    = var.ami_id
    vpc_security_group_ids = [ aws_security_group.allow_expense.id ]
    #count = 3
    count = length(var.instance_names)
    instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"


    tags = merge (var.common_tags, 
      {
        Name = var.instance_names[count.index]
        Module = var.instance_names[count.index]
      }
    )
}
 