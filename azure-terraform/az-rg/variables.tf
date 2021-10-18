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
  type=string
  description = "Assign resource group name here."
  default = "biz-a-infrasea"
}
variable "rg_location" {
  type= string
  description = "Assing resource group location here."
  default = "southeastasia"
}
