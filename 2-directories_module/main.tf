locals {
  default_labels = {
    created_at = [timestamp()]
    owner      = ["sre-team"]
    project    = ["terraform"]
  }
}

resource "btp_directory" "lac" {
  name        = "LAC"
  description = "LAC directory"

  labels = {
    created_at = [timestamp()]
    owner      = local.default_labels["owner"]
    team       = local.default_labels["owner"]
    project    = local.default_labels["project"]
  }
}

resource "btp_directory" "app_dev_rpa" {
  parent_id   = btp_directory.lac.id
  name        = "APP_DEV_RPA"
  description = "Application, Development and Automation directory"
  labels      = merge(local.default_labels, { team = ["app_dev_rpa_team"] })
  depends_on  = [btp_directory.lac]
}

resource "btp_directory" "data_analytics" {
  parent_id   = btp_directory.lac.id
  name        = "DATA_ANALYTICS"
  description = "Data and Analytics directory"
  labels      = merge(local.default_labels, { team = ["data_analytics_team"] })
  depends_on  = [btp_directory.lac]
}

resource "btp_directory" "security" {
  parent_id   = btp_directory.lac.id
  name        = "SECURITY"
  description = "Security directory"
  labels      = merge(local.default_labels, { team = ["security_team"] })
  depends_on  = [btp_directory.lac]
}
