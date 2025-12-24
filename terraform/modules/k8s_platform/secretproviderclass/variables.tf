variable "platform_namespace" {
  type        = string
  description = "Namespace where the SecretProviderClass will be created"
}

variable "keyvault_name" {
  type        = string
  description = "Name of the Azure Key Vault"
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}

variable "objects" {
  type        = list(object({
    objectName = string
    objectType = string
  }))
  description = "List of secrets to mount from Key Vault"
}
