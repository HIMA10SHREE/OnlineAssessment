provider "azurerm"{
    subscription_id = var.subscription_id
    client_id=var.client_id
    client_secret=var.client_secret
    tenant_id=var.tenant_id

    features {
      
    }
}

resource "azurerm_resource_group" "my-resource" {
   name     = var.resource_group_name
   location = var.location
}

resource "azurerm_service_plan" "web_srv_app" {
  name =var.azure_app
  location = var.location
  resource_group_name = var.resource_group_name
  os_type = "Linux"
  sku_name = "F1"
}


resource "azurerm_linux_web_app" "dot_net_app" {
  name="web_app"
  location = var.location
  resource_group_name = var.resource_group_name
  service_plan_id = var.service_plan_id
  site_config {
    always_on = alltrue()
  }
}


