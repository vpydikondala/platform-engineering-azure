terraform {
  backend "azurerm" {
    resource_group_name  = "idp-tfstate-rg"
    storage_account_name = "idppoctfstate12345"
    container_name       = "tfstate"
    key                  = "platform-engineering.tfstate"
  }
}
