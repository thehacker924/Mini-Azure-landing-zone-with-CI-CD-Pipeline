variable "region" {
  type        = string
  description = "Azure region where resources will be deployed."
}
variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group."
}
variable "virtual_network_name" {
  type        = string
  description = "Name of the Azure virtual network."
}
variable "subnet_name" {
  type        = string
  description = "Name of the Azure subnet."
}