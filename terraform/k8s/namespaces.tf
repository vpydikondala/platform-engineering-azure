resource "kubernetes_namespace" "teams" {
  for_each = var.teams
  metadata {
    name = each.value
  }
}
