provider "azurerm"{
    features {
      
    }
}

resource "azurerm_resource_group" "my-resource" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name     =var.acr_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = "Standard"
  admin_enabled            = true
}