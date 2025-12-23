resource "kubernetes_namespace" "namespaces" {
  for_each = toset(var.teams)
  metadata {
    name = "${each.key}-namespace"
  }
}
