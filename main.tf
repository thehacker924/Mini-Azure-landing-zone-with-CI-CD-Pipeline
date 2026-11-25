resource "azurerm_resource_group" "network" {
  name     = "rg-net-prod-eus2-001"
  location = "East US 2"
}
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-hub-prod-eus2-001"
  address_space       = ["10.20.0.0/16"]
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
}