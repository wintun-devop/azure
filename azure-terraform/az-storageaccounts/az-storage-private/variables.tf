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
variable "storage_account_name" {
    type = string 
    description = "Assign your desired storage account name here."
    default = "mybiz01testing01"
}
variable "existing_rg_name" {
  type = string 
  description = "Please your existing resource group name correctly."
  default = "rg-tf-infra"
}
variable "rg_location" {
  type = string
  description = "Please your existing resource group location correctly."
  default = "centralindia"
}
variable "storae_tier" {
  type        = string
  description = "Assign the account storage account tier."
  default     = "Standard"
}
variable "storage_replication" {
    type = string
    description = "Assign the sotorage account replication type."
    default = "LRS"
}
variable "storage_access_tier" {
    type = string
    description = "Assign the storage account access tier(Hot or Cool)."
    default = "Hot"
}
variable "storage_kind" {
    type = string
    description = "Assign the storage account kind."
    default = "StorageV2"
}
variable "https_traffic" {
    type = bool
    description = "Assign https only allow here."
    default = true
}
variable "public_access" {
  type = bool
  description = "Assign blob public access enable or disable here."
  default = false
}
variable "tls_version" {
    type = string
    description = "Assign storage account tls version."
    default = "TLS1_2"
}
variable "versioning" {
    type = bool
    description = "Assign versioning enable or disable here."
    default = false
}
variable "retension" {
    type = number
    description = "Assign retension period for storage account.Assign null to be disable soft delete all together."
    default = null
}
variable "storage_account_metadata" {
    type = map(string)
    description = "Assign storage account metadata as tags."
    default = {
        Name = "storage-1-testing"
        Project = "testing"
    }
}