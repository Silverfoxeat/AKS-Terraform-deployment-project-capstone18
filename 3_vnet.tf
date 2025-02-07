resource "azurerm_virtual_network" "fox-hipaa_vnet" {
  name                = "fox-hipaa-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.fox-hipaa_rsg.location
  resource_group_name = azurerm_resource_group.fox-hipaa_rsg.name

  tags = {
    env = "developement"
  }
}