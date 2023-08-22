variable "ami_id" {
  nullable=false
}

variable "associate_public_ip_address" {
  default = true
}

variable "subnet_id" {
  type = string
  nullable = false
}

variable "volume_size"{
    default = 10
}

variable "name" {
  default = "terra-ec2"
}

variable "security_groups" {
  type = list(string)
  nullable = false
}

variable "key_name" {
  nullable = false
}

variable "instance_type"{
  default = "t2.micro"
  type = string
  nullable = false
}