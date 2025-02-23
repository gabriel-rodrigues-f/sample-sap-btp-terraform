locals {
  subdomain = "app-dev-rpa"
}

resource "btp_subaccount_environment_instance" "app_dev_rpa" {
  subaccount_id    = var.app_dev_rpa_subaccount.id
  name             = local.subdomain
  environment_type = "cloudfoundry"
  service_name     = "cloudfoundry"
  plan_name        = "trial"

  parameters = jsonencode({
    instance_name = local.subdomain
  })
}

data "btp_subaccount_environment_instance" "cloudfoudry" {
  id            = btp_subaccount_environment_instance.app_dev_rpa.id
  subaccount_id = var.app_dev_rpa_subaccount.id

  depends_on = [btp_subaccount_environment_instance.app_dev_rpa]
}

resource "cloudfoundry_space_quota" "medium" {
  name                     = "medium"
  allow_paid_service_plans = false
  instance_memory          = 256
  total_memory             = 2560
  total_app_instances      = 5
  total_routes             = 5
  total_services           = 10
  org                      = data.btp_subaccount_environment_instance.cloudfoudry.platform_id

  depends_on = [btp_subaccount_environment_instance.app_dev_rpa]
}

resource "cloudfoundry_space_quota" "large" {
  name                     = "large"
  allow_paid_service_plans = false
  instance_memory          = 512
  total_memory             = 5120
  total_app_instances      = 10
  total_routes             = 10
  total_services           = 20
  org                      = data.btp_subaccount_environment_instance.cloudfoudry.platform_id

  depends_on = [btp_subaccount_environment_instance.app_dev_rpa]
}

resource "cloudfoundry_space" "dev" {
  name  = "dev"
  org   = data.btp_subaccount_environment_instance.cloudfoudry.platform_id
  quota = cloudfoundry_space_quota.medium.id

  depends_on = [
    btp_subaccount_environment_instance.app_dev_rpa,
    cloudfoundry_space_quota.medium
  ]
}

resource "cloudfoundry_space_users" "dev" {
  space    = cloudfoundry_space.dev.id
  managers = []

  depends_on = [cloudfoundry_space.dev]
}

# resource "null_resource" "create_redis" {
#   provisioner "local-exec" {
#     command = <<EOT
#       cf login -a "https://api.cf.us10-001.hana.ondemand.com" -u P2006753601 -p cCoroJZTXNkl2 -o app-dev-rpa -s dev && \
#       cf set-org-role raquel.santos@lab2dev.com app-dev-rpa OrgManager --origin sap.ids && \
#       cf set-space-role gabriel.freire@lab2dev.com app-dev-rpa dev SpaceManager --origin sap.ids && \
#       cf set-space-role gabriel.freire@lab2dev.com app-dev-rpa dev SpaceDeveloper --origin sap.ids && \
#       cf create-service "application-logs" "lite" "app-logs"
#     EOT
#   }

#   triggers = {
#     always_run = timestamp()
#   }
# }
