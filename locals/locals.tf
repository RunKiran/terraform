locals {
    ami_id = "Z0888896QPD8I09VSA8Z"
    sg_id = "sg-029f294d12a863de6"
    instance_type = var.instance_names == "db" ? "t2.small" : "t2.micro"
    tags = {
        Name = "locals"
    }
}