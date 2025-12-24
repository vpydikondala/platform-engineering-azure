##############################
# CSI Driver
##############################
resource "kubernetes_manifest" "csi_driver" {
  manifest = yamldecode(file("${path.module}/csi-driver.yaml"))

  # Make sure namespaces exist before installing

}

##############################
# SecretProviderClass for Azure Key Vault
##############################
resource "kubernetes_manifest" "secretproviderclass" {
  manifest = yamldecode(jsonencode({
    apiVersion = "secrets-store.csi.x-k8s.io/v1"
    kind       = "SecretProviderClass"
    metadata = {
      name      = "azure-keyvault"
      namespace = var.platform_namespace
    }
    spec = {
      provider   = "azure"
      parameters = {
        keyvaultName = var.keyvault_name
        tenantId     = var.tenant_id
        objects      = var.objects
      }
    }
  }))
}

