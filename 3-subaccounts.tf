# locals {
#   admin_user_role_pairs = flatten([
#     for user in var.subaccount_admin_users : [
#       for role in var.subaccount_admin_profile : {
#         user = user
#         role = role
#       }
#     ]
#   ])
# }

# resource "btp_subaccount_role_collection_assignment" "subaccount_administrator" {
#   for_each = { for pair in local.admin_user_role_pairs : "${pair.user}-${pair.role}" => pair }

#   subaccount_id        = btp_subaccount.app_dev_rpa.id
#   role_collection_name = each.value.role
#   user_name            = each.value.user

#   depends_on = [btp_subaccount.app_dev_rpa]
# }


# locals {
#   view_only_user_role_pairs = flatten([
#     for user in var.subaccount_view_only_users : [
#       for role in var.subaccount_view_only_profile : {
#         user = user
#         role = role
#       }
#     ]
#   ])
# }

# resource "btp_subaccount_role_collection_assignment" "subaccount_viewers" {
#   for_each = { for pair in local.view_only_user_role_pairs : "${pair.user}-${pair.role}" => pair }

#   subaccount_id        = btp_subaccount.app_dev_rpa.id
#   role_collection_name = each.value.role
#   user_name            = each.value.user

#   depends_on = [btp_subaccount.app_dev_rpa]
# }
