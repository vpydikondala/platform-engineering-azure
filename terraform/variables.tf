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
variable "teams" {
  description = "List of application teams for AKS RBAC"
  type        = list(string)
  default     = ["team-a", "team-b"]  # optional, can override in tfvars
}

variable "tenant_id" {
  description = "Azure Tenant ID for OIDC authentication"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID for Terraform"
  type        = string
}
