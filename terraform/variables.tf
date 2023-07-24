variable "aws_region" {
  description = "Region Pattern Used in Atlantico's team."
  default     = "us-west-2"
}

variable "account_id" {
  description = "Account id"
  default     = "018537765140"
}

variable "docker_password" {
  type = string
  description = "Docker password for login"
}

#variable "private_key" {
#  type = string
#  description = "SSH Private key"
#}
#
#variable "ssh_public_key" {
#  type = string
#  description = "SSH Public key"
#}