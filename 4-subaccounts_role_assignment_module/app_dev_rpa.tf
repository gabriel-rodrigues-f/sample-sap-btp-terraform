locals {
  admin_user_role_pairs = flatten([
    for user in var.subaccount_app_dev_rpa_admins : [
      for role in var.subaccount_app_dev_rpa_admin_assignment : {
        user = user
        role = role
      }
    ]
  ])
}

resource "btp_subaccount_role_collection_assignment" "subaccount_administrator" {
  for_each = { for pair in local.admin_user_role_pairs : "${pair.user}-${pair.role}" => pair }

  subaccount_id        = var.app_dev_rpa_subaccount.id
  role_collection_name = each.value.role
  user_name            = each.value.user

  depends_on = [var.app_dev_rpa_subaccount]
}


locals {
  view_only_user_role_pairs = flatten([
    for user in var.subaccount_app_dev_rpa_viewers : [
      for role in var.subaccount_app_dev_rpa_viewer_assignment : {
        user = user
        role = role
      }
    ]
  ])
}

resource "btp_subaccount_role_collection_assignment" "subaccount_viewers" {
  for_each = { for pair in local.view_only_user_role_pairs : "${pair.user}-${pair.role}" => pair }

  subaccount_id        = var.app_dev_rpa_subaccount.id
  role_collection_name = each.value.role
  user_name            = each.value.user

  depends_on = [var.app_dev_rpa_subaccount]
}
