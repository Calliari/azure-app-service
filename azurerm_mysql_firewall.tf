# # connection security
# Allow connection internally from "azure app service"
resource "azurerm_mysql_firewall_rule" "firewall_rule-1" {
  name                = "FirewallRule_1"
  resource_group_name = "${var.azure-resource-group}"
  server_name         = "${var.azure-database-servername}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"

}
# Allow connection from jenkins server on "AWS-dev/demo"
resource "azurerm_mysql_firewall_rule" "firewall_rule-2" {
  name                = "FirewallRule_2"
  resource_group_name = "${var.azure-resource-group}"
  server_name         = "${var.azure-database-servername}"
  start_ip_address    = "123.123.123.123"
  end_ip_address      = "123.123.123.122"
}
