variable "teams" {
  type = set(string)
  default = ["team-a", "team-b"]
}


variable "kubeconfig" {
  type = any
}
