terraform {
  required_version = "1.10.5"
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "1.10.0"
    }
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.53.1"
    }
  }
}

provider "btp" {
  globalaccount = var.global_account_domain
}

provider "cloudfoundry" {
  api_url             = var.cloud_foundry_api_url
  user                = var.sap_corporate_id
  password            = var.sap_corporate_password
  skip_ssl_validation = true
  origin              = "sap.ids"
  app_logs_max        = 30
}