resource "azurerm_mysql_database" "database_name" {
  resource_group_name = "${var.azure-resource-group}"
  server_name         = "${var.azure-database-servername}"
  name                = "${var.database-name}"
  charset             = "utf8mb4"
  collation           = "utf8mb4_general_ci"

  depends_on = ["null_resource.mysql_server"]
}
