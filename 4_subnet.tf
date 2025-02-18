resource "azurerm_subnet" "subnet1" {
  name                 = "hipaa-subnet1"
  address_prefixes     = ["10.10.10.0/24"]
  resource_group_name  = azurerm_resource_group.hipaa_rsg.name
  virtual_network_name = azurerm_virtual_network.hipaa_vnet.name
}

resource "azurerm_subnet" "subnet2" {
  name                 = "hipaa-subnet2"
  address_prefixes     = ["10.10.5.0/24"]
  resource_group_name  = azurerm_resource_group.hipaa_rsg.name
  virtual_network_name = azurerm_virtual_network.hipaa_vnet.name
}