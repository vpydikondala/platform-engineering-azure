variable "keyvault_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "platform_namespace" {
  type = string
}

variable "objects" {
  type = list(object({
    objectName = string
    objectType = string
  }))
}

variable "depends_on" {
  type = list(any)
  default = []
}
