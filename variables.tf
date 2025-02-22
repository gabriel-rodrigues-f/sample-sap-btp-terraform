variable "global_account_manager" {
  description = "Global Account manager"
  type        = string
}

variable "global_account_domain" {
  description = "Global Acocunt domain"
  type        = string
}

variable "env" {
  description = "Corporate environment"
  type        = string
}

variable "cloud_foundry_api_url" {
  description = "SAP P-User"
  type        = string
}

variable "sap_corporate_id" {
  description = "SAP P-User"
  type        = string
  default     = "P2006753601"
}

variable "sap_corporate_password" {
  description = "Default user"
  type        = string
  default     = "cCoroJZTXNkl2"
}

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
