#data "azurerm_client_config" "current" {}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_key_vault" "platform_kv" {
  name                        = "platform-kv-${random_string.suffix.result}"
  location                    = var.location
  resource_group_name         = var.resource_group
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = true
  }

resource "azurerm_key_vault_secret" "grafana_admin_password" {
  name         = "grafana-admin-password"
  value        = var.db_password
  key_vault_id = resource.azurerm_key_vault.platform_kv.id

  depends_on = [
    resource.azurerm_key_vault.platform_kv
  ]
}


