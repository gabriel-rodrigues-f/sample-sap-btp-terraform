locals {
  default_labels = {
    created_at = [timestamp()]
    owner      = ["sre-team"]
    project    = ["terraform"]
  }
}

resource "btp_directory" "root" {
  name        = "ROOT"
  description = "Root directory"

  labels = {
    created_at = [timestamp()]
    owner      = local.default_labels["owner"]
    team       = local.default_labels["owner"]
    project    = local.default_labels["project"]
  }
}

resource "btp_directory" "app_dev_rpa" {
  parent_id   = btp_directory.root.id
  name        = "APP_DEV_RPA"
  description = "Application, Development and Automation directory"
  labels      = merge(local.default_labels, { team = ["app_dev_rpa_team"] })
  depends_on  = [btp_directory.root]
}

resource "btp_directory" "integration" {
  parent_id   = btp_directory.root.id
  name        = "INTEGRATION"
  description = "Integration directory"
  labels      = merge(local.default_labels, { team = ["integration_team"] })
  depends_on  = [btp_directory.root]
}

resource "btp_directory" "data_analytics" {
  parent_id   = btp_directory.root.id
  name        = "DATA_ANALYTICS"
  description = "Data and Analytics directory"
  labels      = merge(local.default_labels, { team = ["data_analytics_team"] })
  depends_on  = [btp_directory.root]
}

resource "btp_directory" "ai" {
  parent_id   = btp_directory.root.id
  name        = "AI"
  description = "AI directory"
  labels      = merge(local.default_labels, { team = ["ai_team"] })
  depends_on  = [btp_directory.root]
}

resource "btp_directory" "security" {
  parent_id   = btp_directory.root.id
  name        = "SECURITY"
  description = "Security directory"
  labels      = merge(local.default_labels, { team = ["security_team"] })
  depends_on  = [btp_directory.root]
}
