resource "azurerm_resource_group" "platform" {
  name     = var.resource_group
  location = var.location
}
