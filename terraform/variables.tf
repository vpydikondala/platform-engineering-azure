variable "resource_group" {
  description = "Azure Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "aks_name" {
  description = "AKS cluster name"
  type        = string
}

variable "teams" {
  description = "Platform teams"
  type        = list(string)
}

variable "db_password" {
  description = "Database password stored in Key Vault"
  type        = string
  sensitive   = true
}
