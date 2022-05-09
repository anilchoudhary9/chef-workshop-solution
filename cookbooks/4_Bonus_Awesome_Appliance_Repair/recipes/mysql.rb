#
# Cookbook:: 4_Bonus_Awesome_Appliance_Repair
# Recipe:: mysql
#
# Copyright:: 2022, The Authors, All Rights Reserved.

mysql_service 'default' do
  port '3306'
  version '5.6'
  initial_root_password node.default['4_Bonus_Awesome_Appliance_Repair']['mysql_root_pass']
  action [:create, :start]
end

# execute 'su mysql'
link '/var/run/mysqld/mysqld.sock' do
  to '/var/run/mysql-default/mysqld.sock'
end
