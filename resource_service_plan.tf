# # Create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.azure-resource-group}"
  location = "${var.azure-location}"
}

# service plan
resource "azurerm_app_service_plan" "service_plan" {
  name                = "${var.azure-service-plan}"
  location            = "${var.azure-location}"
  kind                = "Linux"
  resource_group_name = "${var.azure-resource-group}"

  sku {
    tier = "Standard"
    size = "S1"
    # tier = "Basic"
    # size = "B1"
  }

  # This will allow to build an "App Services with wordpress running in linux"
    properties {
    reserved = true
  }

  depends_on = ["azurerm_resource_group.resource_group"]
}
