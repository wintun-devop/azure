
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
  description = "Assign deisired resource group name here."
  default = "tf-infra"
}
variable "rg_location" {
  type = string
  description = "Assign deisired resource group location here."
  default = "centralindia"
}
variable "rg_tagvalues" {
  type = map
  description = "Assign deisired tag valus for resources group here."
  default = {
    name = "tf-infra"
    project = "testing"
  }
}
variable "vnet_name" {
  type = string
  description = "Assign your desire vnet name here."
  default = "tf-testing"
}
variable "vnet_cidrblock" {
  type = string
  description = "Assign here your desired vnet address space.It should be private ip ranges(rfc-1918)."
  default = "10.200.0.0/16"
}
variable "su_names" {
  type = list(string)
  description = "Assign your subnet name here."
  default = ["GatewaySubnet","sub-1-web-public","sub-2-web-public","sub-3-middle-private","sub-4-middle-private","sub-5-database-private","sub-6-database-private"]
}
variable "subnet_range" {
  type = list(string)
  description = "Assign your subnet range here"
  default = ["10.200.0.0/24","10.200.1.0/24","10.200.2.0/24","10.200.3.0/24","10.200.4.0/24","10.200.5.0/24","10.200.6.0/24"]
}

