# PRE-PRODUCTION WEB SERVER
# App Service production
resource "azurerm_app_service" "azure-app-service" {
  name                = "${var.azure-app-service}"
  location            = "${var.azure-location}"
  resource_group_name = "${var.azure-resource-group}"
  app_service_plan_id = "${var.azure-service-plan}"

  site_config {
    php_version = "7.0"
  }

  app_settings {
    "DATABASE" = "${var.db_credentials["db_name"]}"
    "USER" = "${var.db_credentials["user"]}@${var.db_credentials["user"]}"
    "PASSWORD" = "${var.db_credentials["pass"]}"
    "HOST" = "${var.db_credentials["db_name"]}.mysql.database.azure.com"
  }

  connection_string {
    name  = "${var.azure-database-servername}"
    type  = "SQLServer"
    value = "Server=${var.azure-database-servername}.mysql.database.azure.com;Integrated Security=SSPI"
  }

  connection_string {
    name  = "MYSQLCONNSTR_"
    type  = "MySql"
    value = "Database=${var.db_credentials["db_name"]}; Data Source=${var.azure-database-servername}.mysql.database.azure.com; User Id=${var.db_credentials["user"]}@${var.db_credentials["user"]}; Password=${var.db_credentials["pass"]}"
  }
}
