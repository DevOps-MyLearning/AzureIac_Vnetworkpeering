# Variables
variable "resource_group_name" {
  type    = string
  default = "rg-ladedoyin-training-cc-001"
}

variable "location_hub" {
  type    = string
  default = "NorthCentralUS"
}

variable "location_Network1" {
  type    = string
  default = "WestEurope"
}

variable "location_Network2" {
  type    = string
  default = "SoutheastAsia"
}

variable "hub_vnet_address_space" {
  type    = string
  default = "10.0.0.0/16"
}

variable "Network1_vnet_address_space" {
  type    = string
  default = "10.1.0.0/16"
}

variable "Network2_vnet_address_space" {
  type    = string
  default = "10.2.0.0/16"
}