variable "region" {
  type        = string
  default     = "eu-west-2"
  description = "AWS Region"
}

variable "tags" {
  type = map(string)
  default = {
    managedby = "terraform"
    Name = "csgo-server"
  }
  description = "Additional generic tags"
}

variable "pub_key_filepath" {
  default = "~/.ssh/id_rsa.pub"
}

variable "vpc_cidr_block" {
  default = "172.16.0.0/24"
}

variable "instance_type" {
  default = "m5.xlarge"
}