#http://mmuak.net
#https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA (Please subscribe my channel.Thank You!)
#Define cloud provider as azure
provider "azurerm" {
   subscription_id = "${var.su_id}"
   tenant_id = "${var.tenant}"
   features {}
}
#Define a new resource group
resource "azurerm_resource_group" "rg-tf" {
  name     = "rg-${var.rg_name}"
  location = "${var.rg_location}"
  tags = "${var.rg_tagvalues}"
}
#Define a vent module
module "vnet" {
   source = "Azure/vnet/azurerm"
   version             = "~> 2.0"
   resource_group_name = azurerm_resource_group.rg-tf.name
   vnet_name =lower("vnet-${var.vnet_name}")
   address_space = [var.vnet_cidrblock]
   subnet_prefixes = "${var.subnet_range}"
   subnet_names = "${var.su_names}"
   nsg_ids = {}
   tags = azurerm_resource_group.rg-tf.tags
   depends_on = [azurerm_resource_group.rg-tf]
}
#Define a public network security group
resource "azurerm_network_security_group" "web-public" {
  name                = "sg-web-public"
  location            = azurerm_resource_group.rg-tf.location
  resource_group_name = azurerm_resource_group.rg-tf.name
  security_rule {
    name                       = "web-http"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
   security_rule {
    name                       = "web-https"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
   security_rule {
    name                       = "ssh-remote"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
   security_rule {
    name                       = "icmp-control"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = azurerm_resource_group.rg-tf.tags
}
#Define a private network security group
resource "azurerm_network_security_group" "db-internal" {
  name                = "sg-db-internal"
  location            = azurerm_resource_group.rg-tf.location
  resource_group_name = azurerm_resource_group.rg-tf.name
  security_rule {
    name                       = "mysql-internal"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3306"
    source_address_prefix      = "10.200.0.0/16"
    destination_address_prefix = "10.200.0.0/16"
   }
  security_rule {
    name                       = "ssh-internal"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.200.0.0/16"
    destination_address_prefix = "10.200.0.0/16"
   }
   security_rule {
    name                       = "icmp-internal"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.200.0.0/16"
    destination_address_prefix = "10.200.0.0/16"
   }
  tags = azurerm_resource_group.rg-tf.tags
}

