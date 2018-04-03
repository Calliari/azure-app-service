resource "null_resource" "mysql_server" {
  provisioner "local-exec" {
    command = "az group create --name ${var.azure-resource-group} --location ${var.azure-location};az mysql server create --resource-group ${var.azure-resource-group} --name ${var.azure-database-servername} --location ${var.azure-location} --admin-user ${var.db_credentials["user"]} --admin-password ${var.db_credentials["pass"]} --sku-name GP_Gen5_2 --version 5.7;"
    interpreter = ["PowerShell", "-Command"]
  }
}
