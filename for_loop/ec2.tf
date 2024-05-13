resource "aws_instance" "expense" {
  ami           = var.ami_id
  instance_type = each.value
  for_each = var.instance_names
  

  tags = {
    Name = each.key
    date = "today"
    created_by = "kiran"
  }
}