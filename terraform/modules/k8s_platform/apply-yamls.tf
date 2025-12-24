##############################
# Create Namespaces
##############################

resource "kubernetes_namespace_v1" "namespaces" {
  for_each = toset(var.teams)  # use var.teams for multi-team namespaces

  metadata {
    name = "${each.key}-namespace"
  }
}

##############################
# Apply Platform YAMLs
##############################

locals {
  platform_yamls = [
    "${path.module}/platform/governance/limit-range.yaml",
    "${path.module}/platform/governance/resource-quota.yaml",
    "${path.module}/platform/network-policies/default-deny.yaml",
    "${path.module}/platform/network-policies/allow-ingress.yaml",
   # "${path.module}/platform/security/secret-provider-class.yaml",
    #"${path.module}/platform/security/csi-driver.yaml"
  ]
}

resource "kubernetes_manifest" "platform_yaml" {
  for_each = fileset(path.module, "platform/**/*.yaml")

  manifest = yamldecode(file("${path.module}/${each.value}"))
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
  chart            = "ingress-nginx/ingress-nginx"  # Public chart from stable repo
  create_namespace = true
  values           = [file("${path.module}/platform/ingress/values.yaml")]

  depends_on = [kubernetes_namespace_v1.namespaces]
}
