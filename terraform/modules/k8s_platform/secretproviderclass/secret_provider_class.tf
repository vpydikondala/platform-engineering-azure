##############################
# SecretProviderClass
##############################
resource "kubernetes_manifest" "secretproviderclass" {
  for_each = { for obj in var.objects : obj.objectName => obj }

  manifest = {
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
        objects      = jsonencode([
          for o in var.objects : {
            objectName = o.objectName
            objectType = o.objectType
          }
        ])
      }
    }
  }

  depends_on = var.depends_on
}

##############################
# CSI Driver
##############################
resource "kubernetes_manifest" "csi_driver" {
  manifest = yamldecode(file("${path.module}/csi-driver.yaml"))
  
  depends_on = [kubernetes_manifest.secretproviderclass]
}
