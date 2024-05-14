# Creating azure network 
resource "azurerm_virtual_network" "anupaz-network" {
  resource_group_name = data.azurerm_resource_group.anup-existing-rsgrp.name
  location = data.azurerm_resource_group.anup-existing-rsgrp.location
  name = "anup-network"
  address_space = [ "10.0.0.0/16" ] 
}

# creating subnet 
resource "azurerm_subnet" "anup-subnet1" {
  name = "anup-internal-subnet"
  virtual_network_name = azurerm_virtual_network.anupaz-network.name
  resource_group_name = data.azurerm_resource_group.anup-existing-rsgrp.name
  address_prefixes = [ "10.0.1.0/24" ]
}

# creating network interface from subnet 
resource "azurerm_network_interface" "anup-nic1" {
  name = "anup-network-interface1"
  resource_group_name = data.azurerm_resource_group.anup-existing-rsgrp.name
  location = data.azurerm_resource_group.anup-existing-rsgrp.location

  ip_configuration {
    subnet_id = azurerm_subnet.anup-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.anup-public-ip1.id
    name = "anup-ip1"
  }  
}
# creating public ip 
resource "azurerm_public_ip" "anup-public-ip1" {
    name = "anuppub-ip1"
    resource_group_name = data.azurerm_resource_group.anup-existing-rsgrp.name
    location = data.azurerm_resource_group.anup-existing-rsgrp.location
    allocation_method = "Static" 
}