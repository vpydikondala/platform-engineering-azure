resource "kubernetes_role_v1" "team_role" {
  for_each = toset(var.teams)
  metadata {
    name      = "${each.value}-role"
    namespace = "${each.value}-namespace"
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "services"]
    verbs      = ["get", "list", "watch", "create", "update", "delete"]
  }
}

resource "kubernetes_role_binding" "team_binding" {
  for_each = toset(var.teams)
  metadata {
    name      = "${each.value}-binding"
    namespace = "${each.value}-namespace"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.team_role[each.key].metadata[0].name
  }

  subject {
    kind      = "User"
    name      = "aad-${each.key}-user" # example user, replace with actual AAD group or SP
    api_group = "rbac.authorization.k8s.io"
  }
}
