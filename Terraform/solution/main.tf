module "rg" {

  source = "../Azurerm/azurerm_resource_group"

  name = "${local.prefix}-rg"

  location = local.location



}

module "vnet" {

  source = "../Azurerm/azurerm_virtual_network"

  name = "${local.prefix}-vnet"

  location = "centralus"

  resource_group_name = module.rg.resource_group.name

  address_space = local.vnet_address_space

}

module "subnet" {

  source = "../Azurerm/azurerm_subnets"

  name = "internal"

  vnet_name = module.vnet.virtual_network.name

  resource_group_name = module.rg.resource_group.name

  address_prefixes = local.subnet_address_prefixes


}

module "aks" {

  source = "../Azurerm/azurerm_aks"

  name = "${local.prefix}-aks"

  resource_group_name = module.rg.resource_group.name

  location = "centralus"

  dns_prefix = "${local.prefix}-dns"

  vnet_subnet_id = module.subnet.subnet.id

  identity_type = "SystemAssigned"

  node_resource_group_name = "${local.prefix}-aks"

  default_node_pool_name = local.default_node_pool_name

}

module "sql" {

  source = "../Azurerm/azurerm_sql_db"

  collation = local.sql_db.collation

  resource_group_name = module.rg.resource_group.name

  location = module.rg.resource_group.location

  username = local.sql_db.username

  password = local.sql_db.password

  server_name = "${local.prefix}-sql"

  server_version = local.sql_db.server_version

  dbsize = local.sql_db.dbsize

  zone_redundant = local.sql_db.zone_redundant

  // Create a Database

  sql_database_name = local.sql_db.sql_database_name

  sku_name = local.sql_db.sku_name

  storage_account_type = local.sql_db.storage_account_type

}


module "mssql_virtual_network_rule" {

  source = "../Azurerm/azurerm_mssql_virtual_network_rule"

  name = "${local.prefix}-mvnr"

  server_id = module.sql.sql_server.id

  subnet_id = module.subnet.subnet.id

  depends_on = [
    module.sql,   # ensures SQL Server is fully created
    module.subnet # ensures subnet exists first
  ]
}