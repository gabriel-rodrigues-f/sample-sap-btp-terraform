resource "btp_globalaccount_role_collection_assignment" "global_account_admin" {
  role_collection_name = "Global Account Administrator"
  user_name            = var.username
}