# resource "null_resource" "create_redis" {
#   provisioner "local-exec" {
#     command = <<EOT
#       cf login -a "https://api.cf.eu10.hana.ondemand.com" \
#         -u "${var.cloud_foundry_user}" \
#         -p "${var.cloud_foundry_password}" \
#         -o "${var.cloud_foundry_org}" \
#         -s "${var.cloud_foundry_space}" && \
#       cf create-service "redis" "trial" "redis-cache"
#     EOT
#   }

#   triggers = {
#     always_run = timestamp()
#   }
# }


# resource "null_resource" "configure_users" {
#   depends_on = [
#     cloudfoundry_space.pro_code,
#     cloudfoundry_space.low_code
#   ]

#   provisioner "local-exec" {
#     command = <<EOT
#       cf login -a "https://api.cf.your-cloud.com" -u "${var.cf_username}" -p "${var.cf_password}" -o "${data.btp_subaccount_environment_instance.cloudfoudry.platform_id}"
      
#       cf set-space-role "${var.cf_user_email}" "${data.btp_subaccount_environment_instance.cloudfoudry.platform_id}" "pro_code" "SpaceDeveloper"
      
#       cf set-space-role "${var.cf_user_email}" "${data.btp_subaccount_environment_instance.cloudfoudry.platform_id}" "low_code" "SpaceDeveloper"
#     EOT
#   }
# }