module "document_db" {
  source = "git::https://github.centene.com/paymentintegrity/documentdb?ref=v13.0.0"

  depends_on = [
    module.vnet
  ]

  name = local.app_name
  location = var.location
  tags = local.tags

  enable_replication = true
  failover_location = "us-west"

  private_link = {
    
  }
}