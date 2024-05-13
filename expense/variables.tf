#ec2-variables

variable "instance_type" {
    default = "t2.micro"
    type    = string
}
variable "instance_names" {
    default = [ "frontend", "db", "backend" ]
    type    = list
}
variable "ami_id" {
    default = "ami-090252cbe067a9e58"
    type    = string
    description = "RHEL 9 AMI"
}

variable "common_tags" {
    default = {
        Project = "expense"
        environment = "DEV"
        Terraform = true
    }
}

#SG-variables

variable "sg_name" {
    default = "allow_ssh"
}
variable "sg_discription" {
    default = "allow ssh protocol"
}
variable "allow_port" {
    default = "22"
}
variable "allow_protocol" {
    default = "tcp"
}
variable "allow_CIDR" {
    default = [ "0.0.0.0/0" ]
}

#r53 variables
variable "zone_id" {
    default = "Z0888896QPD8I09VSA8Z"
}
variable "domain_name" {
    default = "mkaws.online"
}