terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
    source  = "hashicorp/azurerm"
    version = ">= 3.64.0"
    }

    azuread = { 
     source = "hashicorp/azuread"
     version = "~> 2.0" 
     }
    kubernetes = { 
        source = "hashicorp/kubernetes"
        version = "~> 2.0" 
        }
  }
}

provider "azurerm" { 
    features {} 
      # Required for OIDC auth
    tenant_id       = "71e06fa4-5653-4c00-a2d9-8e8b7b089fe0"
    subscription_id = "b603af5d-ccdb-4fa9-aa9d-abe1b070d49f"

  # Enables GitHub OIDC authentication
  use_oidc = true
    }
provider "azuread" {}
