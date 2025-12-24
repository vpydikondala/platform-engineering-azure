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
  type = set(string)
  default = ["team-a", "team-b"]
}


variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS cluster"
}
variable "k8s_version" {
  type        = string
  description = "Kubernetes version for the AKS cluster"
}
variable "db_password" {
  type        = string
  description = "Grafana admin password (injected from GitHub Actions)"
  sensitive   = true
}

variable "kubeconfig_path" {
  type        = string
  default     = "./aks.kubeconfig"
  description = "Path to kubeconfig file generated from AKS module"
}
variable "subscription_id" {
    type = string
    description = "Azure subscription ID"
}
variable "tenant_id" {
    type = string
    description = "Azure tenant ID"
}
variable "aks_depends_on" {
  type = any
}