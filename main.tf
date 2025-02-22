module "global_account" {
  source                 = "./1-global_account_module"
  global_account_manager = var.global_account_manager

  providers = {
    btp = btp
  }
}

module "directories" {
  source     = "./2-directories_module"
  depends_on = [module.global_account]

  providers = {
    btp = btp
  }
}

module "subaccounts" {
  source                   = "./3-subaccounts_module"
  env                      = var.env
  depends_on               = [module.directories]
  app_dev_rpa_directory    = module.directories.app_dev_rpa_directory
  security_directory       = module.directories.security_directory
  data_analytics_directory = module.directories.data_analytics_directory

  providers = {
    btp = btp
  }
}
