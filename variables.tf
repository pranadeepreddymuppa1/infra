variable "access_key" {
  type=string
  description = "Provide Access Key"
}

variable "secret_key" {
  type=string
  description = "Provide Secret Key"
}

variable "bucket_name" {
  type=string
  description = "Provide Bucket Name"
}

variable "environment" {
  type = string
}

variable "project" {
  type = string
  default = "postpayc2c"
}

variable "ec2_names" {
  type=set(string)
  default = ["ec21", "ec22", "ec23"]
}

variable "secret_value" {
  type = string
}

variable "keyvaluepair" {
  type = string
}

variable "location" {
  type = string
  default = "us-east-1"
}