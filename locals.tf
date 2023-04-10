locals {

  tags = {
    environment = var.environment
    product = var.project
  }

  app_name = "${var.project}-${var.environment}"

  ip_address = [
    "163.183.0.0./16"
  ]

  cidr = "192.168.0.0/16"
  cidr_sub = "192.168.1.0/24"
  cidr_sub2 = "192.168.2.0/24"
}