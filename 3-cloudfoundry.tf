resource "btp_subaccount_environment_instance" "qa_app_dev_rpa_cf" {
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

data "btp_subaccount_environment_instance" "cloudfoudry_data" {
  id            = btp_subaccount_environment_instance.qa_app_dev_rpa_cf.id
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id

  depends_on = [btp_subaccount_environment_instance.qa_app_dev_rpa_cf]
}

resource "cloudfoundry_space_quota" "medium" {
  name                     = "medium"
  allow_paid_service_plans = false
  instance_memory          = 512
  total_memory             = 5120
  total_app_instances      = 10
  total_routes             = 5
  total_services           = 20
  org                      = data.btp_subaccount_environment_instance.cloudfoudry_data.platform_id
  depends_on               = [btp_subaccount_environment_instance.qa_app_dev_rpa_cf]
}

resource "cloudfoundry_space" "pro_code_space" {
  name  = "pro_code"
  org   = data.btp_subaccount_environment_instance.cloudfoudry_data.platform_id
  quota = cloudfoundry_space_quota.medium.id
  depends_on = [
    btp_subaccount_environment_instance.qa_app_dev_rpa_cf,
    cloudfoundry_space_quota.medium
  ]
}

resource "cloudfoundry_space_users" "pro_code_users" {
  space      = cloudfoundry_space.pro_code_space.id
  managers   = []
  developers = []
  auditors   = []
  depends_on = [cloudfoundry_space.pro_code_space]
}

resource "cloudfoundry_space" "low_code_space" {
  name  = "low_code"
  org   = data.btp_subaccount_environment_instance.cloudfoudry_data.platform_id
  quota = cloudfoundry_space_quota.medium.id
  depends_on = [
    btp_subaccount_environment_instance.qa_app_dev_rpa_cf,
    cloudfoundry_space_quota.medium
  ]
}

resource "cloudfoundry_space_users" "low_code_users" {
  space      = cloudfoundry_space.low_code_space.id
  managers   = []
  developers = []
  auditors   = []
  depends_on = [cloudfoundry_space.low_code_space]
}
