resource "kubernetes_role" "team_role" {
  for_each = local.teams
  metadata {
    name      = "${each.key}-role"
    namespace = each.key
  }

  rule {
    api_groups = [""]
    resources  = ["pods","services","configmaps"]
    verbs      = ["get","list","create","update","delete"]
  }
}

resource "kubernetes_role_binding" "team_binding" {
  for_each = local.teams
  metadata {
    name      = "${each.key}-binding"
    namespace = each.key
  }

  role_ref {
    kind = "Role"
    name = kubernetes_role.team_role[each.key].metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind = "Group"
    name = azuread_group.teams[each.key].display_name
    api_group = "rbac.authorization.k8s.io"
  }
}
