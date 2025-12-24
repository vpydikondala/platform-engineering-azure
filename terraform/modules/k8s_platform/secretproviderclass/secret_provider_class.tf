##############################
# CSI Driver
##############################
resource "kubernetes_manifest" "csi_driver" {
  manifest = yamldecode(file("${path.module}/csi-driver.yaml"))

  # Make sure namespaces exist before installing
  depends_on = [kubernetes_namespace.namespaces]
}

##############################
# SecretProviderClass for Azure Key Vault
##############################
resource "kubernetes_manifest" "secretproviderclass" {
  manifest = yamldecode(templatefile("${path.module}/secret-provider-class.yaml.tpl", {
    keyvault_name      = var.keyvault_name
    tenant_id          = var.tenant_id
    platform_namespace = var.platform_namespace
    objects            = jsonencode(var.objects)
  }))

  depends_on = [kubernetes_namespace.namespaces, kubernetes_manifest.csi_driver]
}
