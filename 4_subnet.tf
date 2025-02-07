resource "azurerm_subnet" "fox-subnet1" {
  name                 = "fox-hipaa-subnet1"
  address_prefixes     = ["10.10.10.0/24"]
  resource_group_name  = azurerm_resource_group.fox-hipaa_rsg.name
  virtual_network_name = azurerm_virtual_network.fox-hipaa_vnet.name
}

resource "azurerm_subnet" "fox-subnet2" {
  name                 = "fox-hipaa-subnet2"
  address_prefixes     = ["10.10.11.0/24"]
  resource_group_name  = azurerm_resource_group.fox-hipaa_rsg.name
  virtual_network_name = azurerm_virtual_network.fox-hipaa_vnet.name
}