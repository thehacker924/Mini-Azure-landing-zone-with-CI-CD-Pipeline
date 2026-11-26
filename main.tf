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
resource "azurerm_subnet" "subnet" {
  name                 = "snet-spoke-prod-eus2-001"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.20.1.0/24"]
}