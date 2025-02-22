output "app_dev_rpa_subaccount" {
  description = "Application, Development and Automation subaccount"
  value       = btp_subaccount.app_dev_rpa
}

output "data_analytics_subaccount" {
  description = "Data and Analytics subaccount"
  value       = btp_subaccount.data_analytics
}

output "security_subaccount" {
  description = "Security subaccount"
  value       = btp_subaccount.security
}
