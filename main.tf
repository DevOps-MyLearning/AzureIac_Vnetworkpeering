
#Terraform Configuration
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Provider
provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "network" {
  name     = var.resource_group_name
  location = var.location_hub
}

# Hub VNet
resource "azurerm_virtual_network" "hub_vnet" {
  name                = "hub-vnet"
  address_space       = [var.hub_vnet_address_space]
  location            = var.location_hub
  resource_group_name = var.resource_group_name
}

# Spoke 1 VNet
resource "azurerm_virtual_network" "spoke1_vnet" {
  name                = "spoke1-vnet"
  address_space       = [var.Network1_vnet_address_space]
  location            = var.location_Network1
  resource_group_name = var.resource_group_name
}

# Spoke 2 VNet
resource "azurerm_virtual_network" "spoke2_vnet" {
  name                = "spoke2-vnet"
  address_space       = [var.Network2_vnet_address_space]
  location            = var.location_Network2
  resource_group_name = var.resource_group_name
}

# Hub to Spoke1 Peering
resource "azurerm_virtual_network_peering" "hub_to_spoke1" {
  name                         = "hub-to-spoke1"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.spoke1_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# Spoke1 to Hub Peering
resource "azurerm_virtual_network_peering" "spoke1_to_hub" {
  name                         = "spoke1-to-hub"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.spoke1_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.hub_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# Hub to Spoke2 Peering
resource "azurerm_virtual_network_peering" "hub_to_spoke2" {
  name                         = "hub-to-spoke2"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.spoke2_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# Spoke2 to Hub Peering
resource "azurerm_virtual_network_peering" "spoke2_to_hub" {
  name                         = "spoke2-to-hub"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.spoke2_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.hub_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# Optional: Spoke1 to Spoke2 Peering
resource "azurerm_virtual_network_peering" "spoke1_to_spoke2" {
  name                         = "spoke1-to-spoke2"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.spoke1_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.spoke2_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# Optional: Spoke2 to Spoke1 Peering
resource "azurerm_virtual_network_peering" "spoke2_to_spoke1" {
  name                         = "spoke2-to-spoke1"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.spoke2_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.spoke1_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# Outputs
output "hub_vnet_id" {
  value = azurerm_virtual_network.hub_vnet.id
}

output "spoke1_vnet_id" {
  value = azurerm_virtual_network.spoke1_vnet.id
}

output "spoke2_vnet_id" {
  value = azurerm_virtual_network.spoke2_vnet.id
}
