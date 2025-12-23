resource "kubernetes_manifest" "platform_yaml" {
  for_each = kubernetes_namespace.namespaces

  manifest = yamldecode(file("${path.module}/platform/observability/values.yaml"))

  depends_on = [
    kubernetes_namespace.namespaces
  ]
}
