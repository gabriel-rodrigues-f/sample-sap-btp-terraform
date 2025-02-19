resource "btp_subaccount" "qa_app_dev_rpa" {
  parent_id  = btp_directory.app_dev_rpa.id
  name       = "QA_APP_DEV_RPA"
  subdomain  = var.subdomain
  region     = "us10"
  depends_on = [btp_directory.app_dev_rpa]

  labels = {
    created_at = [timestamp()]
    owner      = ["sre-team"]
    team       = ["app-dev-rpa-team"]
    project    = ["terraform"]
  }
}
