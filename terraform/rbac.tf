resource "kubernetes_role" "team_role" {
  for_each = toset(var.teams)   # Convert list to set

  metadata {
    name = each.value
    namespace = "team-${each.value}"
  }

  rule {
    api_groups = [""]
    resources  = ["pods"]
    verbs      = ["get", "list", "watch"]
  }
}


resource "kubernetes_role_binding" "team_binding" {
  for_each = var.teams

  metadata {
    name      = "${each.key}-binding"
    namespace = each.key
  }

  role_ref {
    kind      = "Role"
    name      = kubernetes_role.team_role[each.key].metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "Group"
    name      = each.value
    api_group = "rbac.authorization.k8s.io"
  }
}
