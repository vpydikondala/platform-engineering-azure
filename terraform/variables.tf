variable "location" {
  type    = string
  default = "uksouth"
}

variable "resource_group_name" {
  type = string
}

variable "aks_name" {
  type = string
}
variable "tenant_id" {
  description = "Azure Tenant ID for OIDC authentication"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID for Terraform"
  type        = string
}
