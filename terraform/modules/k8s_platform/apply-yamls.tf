resource "kubernetes_manifest" "platform_yaml" {
  for_each = fileset("${path.module}/platform", "**/*.yaml")

  manifest = yamldecode(
    file("${path.module}/platform/${each.value}")
  )

  depends_on = [
    kubernetes_namespace.namespaces
  ]
}
