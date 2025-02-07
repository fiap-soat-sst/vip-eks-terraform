variable "AWS_REGION" {
  default = "none"
  type    = string
}

variable "AWS_S3_BUCKET_SOURCE" {
  default = "none"
  type    = string
}

variable "AWS_S3_BUCKET_DESTINATION" {
  default = "none"
  type    = string
}

variable "AWS_TABLE_USERS" {
  default = 3306
  type    = number
}

variable "AWS_SNS_TOPIC" {
  default = "none"
  type    = string
}

variable "PORT" {
  default = 3001
  type    = number
}

variable "JWT_SECRET" {
  default = "none"
  type    = string
}