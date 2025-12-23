resource "kubernetes_role" "team_role" {
  for_each = var.teams

  metadata {
    name      = "role-${each.key}"
    namespace = each.value
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
    name      = "binding-${each.key}"
    namespace = each.value
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.team_role[each.key].metadata[0].name
  }

  subject {
    kind      = "Group"
    name      = each.key
    api_group = "rbac.authorization.k8s.io"
  }
}
