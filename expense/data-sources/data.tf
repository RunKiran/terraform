data "aws_ami" "ami_id"  {
    most_recent = true

    owners = ["self"]
    filter {
    name   = "state"
    values = ["available"]
    }
    tags = {
        Name   = "app-server"
        Tested = "true
    }    
}