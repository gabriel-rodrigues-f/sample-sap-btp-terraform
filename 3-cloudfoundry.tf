resource "btp_subaccount_environment_instance" "qa_app_dev_rpa" {
  subaccount_id    = btp_subaccount.qa_app_dev_rpa.id
  name             = var.subdomain
  environment_type = "cloudfoundry"
  service_name     = "cloudfoundry"
  plan_name        = "trial"
  depends_on       = [btp_subaccount.qa_app_dev_rpa]

  parameters = jsonencode({
    instance_name = "qa_app_dev_rpa"
  })
}

resource "btp_subaccount_entitlement" "cloud_foundry" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "APPLICATION_RUNTIME"
  plan_name     = "MEMORY"
  amount        = 1
}

data "btp_subaccount_environment_instance" "cloudfoudry" {
  id            = btp_subaccount_environment_instance.qa_app_dev_rpa.id
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id

  depends_on = [btp_subaccount_environment_instance.qa_app_dev_rpa]
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

  depends_on = [btp_subaccount_environment_instance.qa_app_dev_rpa]
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

  depends_on = [btp_subaccount_environment_instance.qa_app_dev_rpa]
}

resource "cloudfoundry_space" "pro_code" {
  name  = "pro_code"
  org   = data.btp_subaccount_environment_instance.cloudfoudry.platform_id
  quota = cloudfoundry_space_quota.medium.id

  depends_on = [
    btp_subaccount_environment_instance.qa_app_dev_rpa,
    cloudfoundry_space_quota.medium
  ]
}

resource "cloudfoundry_space_users" "pro_code" {
  space      = cloudfoundry_space.pro_code.id
  managers   = []
  developers = []
  auditors   = []
  depends_on = [cloudfoundry_space.pro_code]
}

resource "cloudfoundry_space" "low_code" {
  name  = "low_code"
  org   = data.btp_subaccount_environment_instance.cloudfoudry.platform_id
  quota = cloudfoundry_space_quota.medium.id

  depends_on = [
    btp_subaccount_environment_instance.qa_app_dev_rpa,
    cloudfoundry_space_quota.medium
  ]
}

resource "cloudfoundry_space_users" "low_code" {
  space      = cloudfoundry_space.low_code.id
  managers   = []
  developers = []
  auditors   = []
  depends_on = [cloudfoundry_space.low_code]
}
