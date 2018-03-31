#!/bin/bash

# replace the varibles on this file with the varibles used on "varibles.tf" file:
# VARIABLE_RESOURCE_GROUP
# VARIABLE_LOCATION
# VARIABLE_MYSQL_RESOURCE_SERVERNAME
# VARIABLE_MYSQL_ADMIN_USERNAME
# VARIABLE_MYSQL_PASSWORD

resourceGroupName=$(az group create --name VARIABLE_RESOURCE_GROUP --location VARIABLE_LOCATION --query name)

mysqlServer=$(az mysql server create --resource-group VARIABLE_RESOURCE_GROUP --name VARIABLE_MYSQL_RESOURCE_SERVERNAME --location VARIABLE_LOCATION --admin-user VARIABLE_MYSQL_ADMIN_USERNAME --admin-password VARIABLE_MYSQL_PASSWORD --sku-name GP_Gen5_2 --version 5.7 --query name)


echo "{
  \"ResourceGroupName\":$resourceGroupName,
  \"MysqlServerName\":$mysqlServer
}"
