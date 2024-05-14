# keyword   function                name of function -- this is not for providers 
resource "azurerm_resource_group" "ashu-rsgrp" {
  name = "ashu-resource-group1"
  location = "Central US"
}
# using existing resources group 
# data "azurerm_resource_group" "ashu-existing-rsgrp" {
#   name = "ashu-manual-resourcesgrp"
# }