variable "name"{
    type=string
}
variable "description"{
      description = "Description of the security group"
    type=string
    default="security group for application"
}

variable "vpc_id"{
    type=string
}

variable "ssh_cidr_block"{
    type=list(string)
    default = [ "0.0.0.0/0" ]
}
variable "http_cidr_block"{
    type=list(string)
    default = [ "0.0.0.0/0" ]
}