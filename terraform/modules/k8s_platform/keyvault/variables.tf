variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}

variable "db_password" {
  type        = string
  description = "Grafana admin password (injected from GitHub Actions)"
  sensitive   = true
}
variable "platform_namespace" {
  description = "Namespace for platform security resources"
  type        = string
  default     = "platform-security"
}

