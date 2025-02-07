
variable "port" {
  default = 3125
  type    = number
}

variable "aws_region" {
  default = "none"
  type = string
}

variable "aws_table_users" {
  default = "none"
  type = string
}

variable "email_host" {
  default = "none"
  type = string
}

variable "email_port" {
  default = "none"
  type = number
}

variable "email_user" {
  default = "none"
  type = string
}

variable "email_password" {
  default = "none"
  type = string
}
