resource "azurerm_key_vault" "platform_kv" {
  name                        = "kv-platform-${random_id.suffix.hex}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = false
}
