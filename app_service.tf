# PRE-PRODUCTION WEB SERVER
# App Service production
resource "azurerm_app_service" "azure-app-service" {
  name                = "${var.azure-app-service}"
  location            = "${var.azure-location}"
  resource_group_name = "${var.azure-resource-group}"
  app_service_plan_id = "${azurerm_app_service_plan.service_plan.id}"

  site_config {
    php_version = "7.0"
  }

  app_settings {
    # * this is passed to wp-config.php file ==> connect to the databases
    "DATABASE" = "${var.database-name}"
    "USER" = "${var.db_credentials["user"]}@${var.db_credentials["user"]}"
    "PASSWORD" = "${var.db_credentials["pass"]}"
    "HOST" = "${var.database-name}.mysql.database.azure.com"

     # * Authentication Unique Keys and Salts.

     "AUTH_KEY" = "${var.db_credentials["auth_key"]}"
     "SECURE_AUTH_KEY" = "${var.db_credentials["secure_auth_key"]}"
     "LOGGED_IN_KEY" = "${var.db_credentials["logged_in_key"]}"
     "NONCE_KEY" = "${var.db_credentials["nonce_key"]}"
     "AUTH_SALT" = "${var.db_credentials["auth_salt"]}"
     "SECURE_AUTH_SALT" = "${var.db_credentials["secure_auth_salt"]}"
     "LOGGED_IN_SALT" = "${var.db_credentials["logged_in_salt"]}"
     "NONCE_SALT" = "${var.db_credentials["nonce_salt"]}"

  }

  connection_string {
    name  = "${var.azure-database-servername}"
    type  = "SQLServer"
    value = "Server=${var.azure-database-servername}.mysql.database.azure.com;Integrated Security=SSPI"
  }

  connection_string {
    name  = "MYSQLCONNSTR_"
    type  = "MySql"
    value = "Database=${var.database-name}; Data Source=${var.azure-database-servername}.mysql.database.azure.com; User Id=${var.db_credentials["user"]}@${var.db_credentials["user"]}; Password=${var.db_credentials["pass"]}"
  }

    depends_on = ["azurerm_app_service_plan.service_plan"]
}
