resource "btp_subaccount_entitlement" "cloud_foundry" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "APPLICATION_RUNTIME"
  plan_name     = "MEMORY"
  amount        = 1
}

resource "btp_subaccount_entitlement" "integration_suite" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "integrationsuite-trial"
  plan_name     = "trial"
  amount        = 1
}

resource "btp_subaccount_entitlement" "process_integration_integration_flow" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "it-rt"
  plan_name     = "integration-flow"
}

resource "btp_subaccount_entitlement" "process_integration_integration_api" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "it-rt"
  plan_name     = "api"
}

resource "btp_subaccount_entitlement" "api_management_apiportal_apiaccess" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "apimanagement-apiportal-trial"
  plan_name     = "apiportal-apiaccess"
}

resource "btp_subaccount_entitlement" "cicd" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "cicd-app"
  plan_name     = "trial"
  amount        = 1
}

resource "btp_subaccount_entitlement" "kyma" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "kymaruntime"
  plan_name     = "trial"
  amount        = 1
}

resource "btp_subaccount_entitlement" "build_apps" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "sap-build-apps"
  plan_name     = "free"
  amount        = 1
}

resource "btp_subaccount_entitlement" "build_code" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "build-code"
  plan_name     = "free"
}

resource "btp_subaccount_entitlement" "process_automation" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "process-automation"
  plan_name     = "free"
}

resource "btp_subaccount_entitlement" "work_zone" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "SAPLaunchpad"
  plan_name     = "standard"
}

resource "btp_subaccount_entitlement" "business_application_studio" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  service_name  = "sapappstudiotrial"
  plan_name     = "trial"
}