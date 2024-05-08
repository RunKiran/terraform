#<resource> <resouce-type><resouce-name>



resource "aws_instance" "web" {
  ami           = var.image_id
  instance_type = var.instance_name == "DB" ? "t2.micro" : "t3.micro"
  
}