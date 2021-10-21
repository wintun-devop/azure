#http://mmuak.net
#https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA (Please subscribe my channel.Thank You!)
variable "su_id" {
  type = string 
  description = "subscription id for your azure account."
}
variable "tenant" {
  type = string 
  description = "azure ad tenant id for your account."
}
variable "rg_name" {
  type = string 
  description = "Plase here your existing resource group correctly."
  default = ""
}
variable "rg_location" {
  type = string 
  description = "Plase here region for existing resource group correctly."
  default = "centralindia"
}
variable "vnet_name" {
  type = string
  description = "Assign your desire vnet name here."
  default = "vnet-ap-tf-testing"
}