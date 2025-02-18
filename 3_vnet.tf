resource "azurerm_virtual_network" "hipaa_vnet" {
  name                = "hipaa-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.hipaa_rsg.location
  resource_group_name = azurerm_resource_group.hipaa_rsg.name

  tags = {
    env = "developement"
  }
}