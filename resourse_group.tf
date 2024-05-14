# keyword   function                name of function -- this is not for providers 
# resource "azurerm_resource_group" "anup-rsgrp" {
#   name = "anup-resource-group1"
#   location = "Central US"
# }
# using existing resources group 
data "azurerm_resource_group" "anup-existing-rsgrp" {
  name = "anup-manual-resourcesgrp"
}