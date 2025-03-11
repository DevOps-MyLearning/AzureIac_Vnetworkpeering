variable "resource_group_name" {
  type    = string
  default = "rg-ladedoyin-training-cc-001"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "hub_vnet_address_space" {
  type    = string
  default = "10.0.0.0/16"
}

variable "spoke1_vnet_address_space" {
  type    = string
  default = "10.1.0.0/16"
}

variable "spoke2_vnet_address_space" {
  type    = string
  default = "10.2.0.0/16"
}


