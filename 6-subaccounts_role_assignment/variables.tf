variable "subaccount_app_dev_rpa_admin_assignment" {
  description = "SAP BTP Admin Role"
  type        = list(string)
}

variable "subaccount_app_dev_rpa_viewer_assignment" {
  description = "SAP BTP View Only Role"
  type        = list(string)
}

variable "subaccount_app_dev_rpa_admins" {
  description = "Admin users"
  type        = list(string)
}

variable "subaccount_app_dev_rpa_viewers" {
  description = "Admin users"
  type        = list(string)
}

variable "app_dev_rpa_subaccount" {
  description = "Application, Development and Automation subaccount"
}