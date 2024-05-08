variable "image_id"  {
    type = string
    default = "ami-090252cbe067a9e58"
    description = "RHEL-9 AMI ID"
}

variable "instance_type"  {
    default = "t2.micro"
    type    = string
}

variable "tags"  {
    default = {
        project = "expense"
        environment = "DEV"                                                                             
        module  =   "DB"
      
    }
}

variable "sg_name" {
    default = "allow_ssh"
}
variable "sg_discription" {
    default = "allowing port 22"
}
variable "allow_port" {
    default = "22"
}
variable "allow_protocol" {
    default = "tcp"
}
variable "allow_CIDR" {
    type = list(string)
    default = ["0.0.0.0/0"]
}