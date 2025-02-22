locals {
  region = "us10"

  default_labels = {
    created_at = [timestamp()]
    owner      = ["sre-team"]
    project    = ["terraform"]
  }

  teams = {
    app_dev_rpa    = "app-dev-rpa-team"
    integration    = "integration-team"
    data_analytics = "data-analytics-team"
    ai             = "ai-team"
    security       = "security-team"
  }
}

resource "btp_subaccount" "app_dev_rpa" {
  parent_id = var.app_dev_rpa_directory.id
  name      = "${upper(var.env)}_APP_DEV_RPA"
  subdomain = "app-dev-rpa"
  region    = local.region
  labels    = merge(local.default_labels, { team = [local.teams.app_dev_rpa] })
}

resource "btp_subaccount" "data_analytics" {
  parent_id = var.data_analytics_directory.id
  name      = "${upper(var.env)}_DATA_ANALYTICS"
  subdomain = "data-analytics"
  region    = local.region
  labels    = merge(local.default_labels, { team = [local.teams.data_analytics] })
}

resource "btp_subaccount" "security" {
  parent_id = var.security_directory.id
  name      = "${upper(var.env)}_SECURITY"
  subdomain = "security"
  region    = local.region
  labels    = merge(local.default_labels, { team = [local.teams.security] })
}
