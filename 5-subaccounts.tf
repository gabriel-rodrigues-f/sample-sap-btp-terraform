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

locals {
  admin_user_role_pairs = flatten([
    for user in var.admin_users : [
      for role in var.admin_role_collection : {
        user = user
        role = role
      }
    ]
  ])
}

resource "btp_subaccount_role_collection_assignment" "subaccount_administrator" {
  for_each = { for pair in local.admin_user_role_pairs : "${pair.user}-${pair.role}" => pair }

  subaccount_id        = btp_subaccount.qa_app_dev_rpa.id
  role_collection_name = each.value.role
  user_name            = each.value.user

  depends_on = [btp_subaccount.qa_app_dev_rpa]
}


locals {
  view_only_user_role_pairs = flatten([
    for user in var.view_only_users : [
      for role in var.view_only_role_collection : {
        user = user
        role = role
      }
    ]
  ])
}

resource "btp_subaccount_role_collection_assignment" "subaccount_viewers" {
  for_each = { for pair in local.view_only_user_role_pairs : "${pair.user}-${pair.role}" => pair }

  subaccount_id        = btp_subaccount.qa_app_dev_rpa.id
  role_collection_name = each.value.role
  user_name            = each.value.user

  depends_on = [btp_subaccount.qa_app_dev_rpa]
}