terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "1.9.0"
    }
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.53.1"
    }
  }
}

provider "btp" {
  globalaccount = var.domain
}

provider "cloudfoundry" {
  api_url             = var.cloud_foundry_api_url
  user                = var.p_user
  password            = var.password
  skip_ssl_validation = true
  origin              = "sap.ids"
  app_logs_max        = 30
}