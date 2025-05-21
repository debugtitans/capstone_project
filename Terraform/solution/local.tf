locals {


  prefix = "devops1-week12-capstone-debugtitans" #Put your own prefic here

  location               = "centralus" #Put your own region here
  default_node_pool_name = "sau"

  vnet_address_space = ["10.2.0.0/16"]

  subnet_address_prefixes = ["10.2.2.0/24"]

# change the info below based on your need. or you can leave them as is

  sql_db = {
    username             = "debugadmin"
    collation            = "SQL_Latin1_General_CP1_CI_AS"
    password             = "Admin@12345678!"
    server_version       = "12.0"
    dbsize               = 1
    zone_redundant       = false
    sql_database_name    = "debugtitans-sql"
    sku_name             = "Basic"
    storage_account_type = "Local"

  }




}