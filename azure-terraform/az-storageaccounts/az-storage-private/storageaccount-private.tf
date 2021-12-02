#http://mmuak.net
#https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA (Please subscribe my channel.Thank You!)
provider "azurerm" {
  subscription_id = "${var.su_id}"
  tenant_id = "${var.tenant}"
  features {}
}
#Define storage account in existing resource group
resource "azurerm_storage_account" "az_storage_private" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${var.existing_rg_name}"
  location                 = "${var.rg_location}"
  account_tier             = "${var.storae_tier}"
  account_replication_type = "${var.storage_replication}"
  access_tier = "${var.storage_access_tier}"
  account_kind = "${var.storage_kind}"
  enable_https_traffic_only = "${var.https_traffic}"
  allow_blob_public_access="${var.public_access}"
  min_tls_version = "${var.tls_version}"
  blob_properties {
    versioning_enabled = "${var.versioning}"
    delete_retention_policy {
      days = "${var.retension}"
    } 
 }
 tags = "${var.storage_account_metadata}"
}