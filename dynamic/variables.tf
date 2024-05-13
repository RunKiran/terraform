variable "inbound_rules" {
  type = list
  default = [
    {
        port = 22
        allow_CIDR = ["0.0.0.0/0"]
        protocol = "tcp"
    },
    {
        port = 80
        allow_CIDR = ["0.0.0.0/0"]
        protocol = "tcp"
    },
    {
        port = 8080
        allow_CIDR = ["0.0.0.0/0"]
        protocol = "tcp"
    }
  ]
}