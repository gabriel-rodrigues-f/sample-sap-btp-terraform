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

module "subaccounts_role_assignment" {
  source                    = "./4-subaccounts_role_assignment_module"
  depends_on                = [module.subaccounts]
  
  app_dev_rpa_subaccount    = module.subaccounts.app_dev_rpa_subaccount
  data_analytics_subaccount = module.subaccounts.data_analytics_subaccount
  security_subaccount       = module.subaccounts.security_subaccount

  subaccount_app_dev_rpa_admin_assignment  = var.subaccount_app_dev_rpa_admin_assignment
  subaccount_app_dev_rpa_viewer_assignment = var.subaccount_app_dev_rpa_viewer_assignment
  subaccount_app_dev_rpa_admins            = var.subaccount_app_dev_rpa_admins
  subaccount_app_dev_rpa_viewers           = var.subaccount_app_dev_rpa_viewers

  providers = {
    btp = btp
  }
}
