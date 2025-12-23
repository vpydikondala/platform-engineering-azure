resource "kubernetes_namespace" "team_ns" {
  for_each = toset(var.teams)
  metadata {
    name = "${each.value}-namespace"
  }
}
