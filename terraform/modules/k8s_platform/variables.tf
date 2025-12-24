variable "teams" {
  type = set(string)
  default = ["team-a", "team-b"]
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
