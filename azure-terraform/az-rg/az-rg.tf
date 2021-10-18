#http://mmuak.net
#https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA (Please subscribe my channel.Thank You!)
provider "azurerm" {
  subscription_id = "${var.su_id}"
  tenant_id = "${var.tenant}"
  features {}
}
resource "azurerm_resource_group" "rg-single" {
  name     = "${var.rg_name}"
  location = "${var.rg_location}"
  tags={
      Name="biz-a"
      Project="testing"
  }
}