# gpa-intranet-bbd-provision

THIS WORKS ON MAC OR LINUX ONLY NOT FOR WINDOWS

RESOURCES that wii be created with this infrastructure as code:

RESOURCES:
1 Resource Group to group resources together
1 Resource plan
1 app service using linux OS
1 MySQL server
1 DATABASE created on MySQL server



Create a file called "variables.tf" to define how the environment will be created.

This command will create a file but the variable should be sill need to be defined

EXAMPLE:

```
tee variables.tf <<'EOF'

variable "azure-location" {
  default = "uksouth"
  description = "Name of the azure resource group"
}
variable "azure-resource-group" {
  default = ""
  description = "Name of the azure resource group"
}

variable "azure-service-plan" {
  default = ""
  description = "Name of the azure resource plan"
}

variable "azure-database-servername" {
  default = ""
  description = "Name of the azure resource app service web"
}


variable "db_credentials" {
  type = "map"
  description = "variables for azure resource database server"

  # Map credentials for the database
  default = {
    db_name = ""
    user = ""
    pass = ""
  }

}

variable "azure-app-service" {
  default = ""
  description = "Name of the azure resource app service web"
}

EOF

```
# azure-app-service
