resource "btp_directory" "root" {
  name        = "ROOT"
  description = "Root directory"

  labels = {
    created_at = [timestamp()]
    owner      = ["sre-team"]
    team       = ["sre-team"]
    project    = ["terraform"]
  }
}

resource "btp_directory" "app_dev_rpa" {
  parent_id   = btp_directory.root.id
  name        = "APP_DEV_RPA"
  description = "Application, Development and Automation directory"
  depends_on  = [btp_directory.root]

  labels = {
    created_at = [timestamp()]
    owner      = ["sre-team"]
    team       = ["app-dev-rpa-team"]
    project    = ["terraform"]
  }
}
