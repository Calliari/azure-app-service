resource "azurerm_mysql_database" "database_name" {
  resource_group_name = "${var.azure-resource-group}"
  server_name         = "${var.azure-database-servername}"
  name                = "${var.db_credentials["db_name"]}"
  charset             = "utf8mb4"
  collation           = "utf8mb4_general_ci"
}
