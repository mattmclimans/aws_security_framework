resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  location            = var.location
  address_space       = [var.address_space]
  resource_group_name = var.resource_group_name
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  name                      = element(var.subnet_names, count.index)
  virtual_network_name      = azurerm_virtual_network.vnet.name
  resource_group_name       = var.resource_group_name
  address_prefix            = element(var.subnet_prefixes, count.index)
 # network_security_group_id = lookup(var.nsg_ids, var.subnet_names[count.index], "")
  count                     = length(var.subnet_names)
}
