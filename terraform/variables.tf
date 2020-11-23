variable "region" {
  type        = string
  default     = "eu-central-1"
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