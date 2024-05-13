resource "aws_instance" "DB" {
  ami           = var.image_id
  instance_type = var.instance_type
  
  count = length(var.instance_names)

  tags = {
    Name = var.instance_names[count.index]
    date = "today"
    created_by = "kiran"
  }
}