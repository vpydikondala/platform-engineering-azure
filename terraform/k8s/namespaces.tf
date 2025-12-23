resource "kubernetes_namespace" "teams" {
  for_each = local.teams
  metadata {
    name = each.key
    labels = {
      owner = each.key
      env   = "nonprod"
    }
  }
}
