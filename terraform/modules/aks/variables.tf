variable "aks_name" {}
variable "location" {}
variable "resource_group" {}
variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS cluster"
}
