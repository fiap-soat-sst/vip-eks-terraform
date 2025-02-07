variable "AWS_REGION" {
  default = "none"
  type    = string
}

variable "AWS_S3_BUCKET" {
  default = "none"
  type    = string
}

variable "AWS_TABLE_USERS" {
  default = "none"
  type    = string
}

variable "AWS_SNS_TOPIC" {
  default = "none"
  type    = string
}

variable "JWT_SECRET" {
  default = "none"
  type    = string
}

variable "port" {
  default = 3125
  type    = number
}
