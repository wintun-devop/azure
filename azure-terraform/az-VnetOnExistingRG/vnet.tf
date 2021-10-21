#http://mmuak.net
#https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA (Please subscribe my channel.Thank You!)
provider "azurerm" {
  subscription_id = "${var.su_id}"
  tenant_id = "${var.tenant}"
  features {}
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  location            = "${var.rg_location}"
  resource_group_name = "${var.rg_name}"
  address_space       = ["10.100.0.0/16"]
  subnet {
    name           = "sub-1-web-public"
    address_prefix = "10.100.1.0/24"
  }
  subnet {
    name           = "sub-2-web-public"
    address_prefix = "10.100.2.0/24"
  }
  subnet {
    name           = "sub-3-middle-private"
    address_prefix = "10.100.3.0/24"
  }
   subnet {
    name           = "sub-4-middle-private"
    address_prefix = "10.100.4.0/24"
  }
    subnet {
    name           = "sub-5-database-private"
    address_prefix = "10.100.5.0/24"
  }
    subnet {
    name           = "sub-6-database-private"
    address_prefix = "10.100.6.0/24"
  }
  tags = {
    Business="biz-a"
    Projet="terraform-testing"
  }
}
resource "azurerm_network_security_group" "web-public" {
  name                = "sg-web-public"
  location            = azurerm_virtual_network.vnet.location
  resource_group_name = azurerm_virtual_network.vnet.resource_group_name

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
  tags = {
    Business="biz-a"
    Projet="terraform-testing"
  }
}
resource "azurerm_network_security_group" "db-internal" {
  name                = "sg-db-internal"
  location            = azurerm_virtual_network.vnet.location
  resource_group_name = azurerm_virtual_network.vnet.resource_group_name
  security_rule {
    name                       = "mysql-internal"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3306"
    source_address_prefix      = "10.100.0.0/16"
    destination_address_prefix = "10.100.0.0/16"
   }
  security_rule {
    name                       = "ssh-internal"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.100.0.0/16"
    destination_address_prefix = "10.100.0.0/16"
   }
   security_rule {
    name                       = "icmp-internal"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.100.0.0/16"
    destination_address_prefix = "10.100.0.0/16"
   }
   tags = {
    Business="biz-a"
    Projet="terraform-testing"
  }
}

