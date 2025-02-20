resource "btp_subaccount_subscription" "integration_suite" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  app_name      = "it-cpitrial05-prov"
  plan_name     = "trial"

  depends_on = [ btp_subaccount_entitlement.integration_suite ]
}

resource "btp_subaccount_subscription" "business_application_studio" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  app_name      = "sapappstudiotrial"
  plan_name     = "trial"

  depends_on = [ btp_subaccount_entitlement.business_application_studio ]
}

resource "btp_subaccount_subscription" "work_zone" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  app_name      = "SAPLaunchpad"
  plan_name     = "standard"

  depends_on = [ btp_subaccount_entitlement.work_zone ]
}

resource "btp_subaccount_subscription" "process_automation" {
  subaccount_id = btp_subaccount.qa_app_dev_rpa.id
  app_name      = "process-automation"
  plan_name     = "free"

  depends_on = [ btp_subaccount_entitlement.process_automation ]
}
