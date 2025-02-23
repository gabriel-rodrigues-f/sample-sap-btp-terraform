module "directories" {
  source = "./0-directories"

  providers = {
    btp = btp
  }
}

module "subaccounts" {
  source                = "./1-subaccounts"
  env                   = var.env
  depends_on            = [module.directories]
  app_dev_rpa_directory = module.directories.app_dev_rpa_directory

  providers = {
    btp = btp
  }
}

module "entitlements" {
  source     = "./2-entitlements"
  depends_on = [module.subaccounts]

  app_dev_rpa_subaccount = module.subaccounts.app_dev_rpa_subaccount
}

module "environments" {
  source                 = "./3-environments"
  depends_on             = [module.entitlements]
  app_dev_rpa_subaccount = module.subaccounts.app_dev_rpa_subaccount

  providers = {
    btp          = btp
    cloudfoundry = cloudfoundry
  }
}

module "subscriptions" {
  source                 = "./4-subscriptions"
  depends_on             = [module.environments]
  app_dev_rpa_subaccount = module.subaccounts.app_dev_rpa_subaccount

  providers = {
    btp = btp
  }
}

# module "services" {
#   source     = "./5-services"
#   depends_on = [module.subscriptions]
#   app_dev_rpa_dev_space = var.app_dev_rpa_dev_space
# }

# module "subaccounts_role_assignment" {
#   source     = "./6-subaccounts_role_assignment"
#   depends_on = [module.entitlements]

#   app_dev_rpa_subaccount = module.subaccounts.app_dev_rpa_subaccount

#   subaccount_app_dev_rpa_admins            = var.subaccount_app_dev_rpa_admins
#   subaccount_app_dev_rpa_admin_assignment  = var.subaccount_app_dev_rpa_admin_assignment
#   subaccount_app_dev_rpa_viewers           = var.subaccount_app_dev_rpa_viewers
#   subaccount_app_dev_rpa_viewer_assignment = var.subaccount_app_dev_rpa_viewer_assignment

#   providers = {
#     btp = btp
#   }
# }
