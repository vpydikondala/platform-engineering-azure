variable "aks_name" {}
variable "location" {}
variable "resource_group" {}
variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS cluster"
}
variable "k8s_version" {
  type        = string
  description = "Kubernetes version for the AKS cluster"
}

