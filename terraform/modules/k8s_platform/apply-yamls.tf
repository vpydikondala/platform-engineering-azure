##############################
# Create Namespaces
##############################

resource "kubernetes_namespace_v1" "namespaces" {
  for_each = toset(var.teams)

  metadata {
    name = "${each.key}-namespace"
  }
}

##############################
# Apply Platform YAMLs (per team namespace)
# - Only apply real Kubernetes manifests (exclude Helm values/chart YAMLs)
# - Force namespace for resources that require it (NetworkPolicy, ResourceQuota, LimitRange)
##############################

locals {
  team_namespaces = [for t in var.teams : "${t}-namespace"]

  # fileset() returns a set(string) -> convert to list before concat
  platform_manifest_files = concat(
    tolist(fileset(path.module, "platform/governance/*.yaml")),
    tolist(fileset(path.module, "platform/network-policies/*.yaml"))
  )

  team_manifest_matrix = {
    for pair in setproduct(local.team_namespaces, local.platform_manifest_files) :
    "${pair[0]}::${pair[1]}" => {
      namespace = pair[0]
      file      = pair[1]
    }
  }
}

resource "kubernetes_manifest" "platform_yaml" {
  for_each = local.team_manifest_matrix

  manifest = merge(
    yamldecode(file("${path.module}/${each.value.file}")),
    {
      metadata = merge(
        try(yamldecode(file("${path.module}/${each.value.file}")).metadata, {}),
        { namespace = each.value.namespace }
      )
    }
  )

  depends_on = [kubernetes_namespace_v1.namespaces]
}

##############################
# Helm Release: Observability (Prometheus + Grafana)
##############################

resource "helm_release" "observability" {
  name             = "observability"
  namespace        = "platform-observability"
  chart            = "${path.module}/platform/observability"
  create_namespace = true
  values           = [file("${path.module}/platform/observability/values.yaml")]

  depends_on = [kubernetes_namespace_v1.namespaces]
}

##############################
# Helm Release: Ingress Controller (NGINX)
##############################

resource "helm_release" "ingress" {
  name             = "nginx-ingress"
  namespace        = "platform-ingress"
  chart            = "ingress-nginx/ingress-nginx"
  create_namespace = true
  values           = [file("${path.module}/platform/ingress/values.yaml")]

  depends_on = [kubernetes_namespace_v1.namespaces]
}
