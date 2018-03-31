data "external" "powershell_test" {
  # program = ["Powershell.exe", "./testScript.ps1"]
  program = ["bash", "./resource_group_mysql_server.sh"]

  # query = {
  #   foo = "${var.someString}"
  #   bar = "Hardcoded"
  # }
}
