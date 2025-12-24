variable "teams" {
  type = list(string)
}

variable "cluster_name" {
  type = string
}

variable "kubeconfig" {
  type = any
}
variable "namespaces" {
  type    = list(string)
  default = ["team-a-namespace", "team-b-namespace", "platform-observability", "platform-ingress"]
}

