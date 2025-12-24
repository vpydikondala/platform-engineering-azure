variable "teams" {
  type = set(string)
  default = ["team-a", "team-b"]
}

variable "aks_module" {
  type        = any
  description = "Reference to the AKS module to get cluster outputs"
}
variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
}
variable "kubeconfig" {
  type = any
}
variable "namespaces" {
  type    = list(string)
  default = ["team-a-namespace", "team-b-namespace", "platform-observability", "platform-ingress"]
}
