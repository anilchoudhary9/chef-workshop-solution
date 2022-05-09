#
# Cookbook:: 4_Bonus_Awesome_Appliance_Repair
# Recipe:: apache
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Install Apache service
package node.default['4_Bonus_Awesome_Appliance_Repair']['apache_service_name'] do
  action :install
end

# Enable and start Apache service
service node.default['4_Bonus_Awesome_Appliance_Repair']['apache_service_name'] do
  action [ :enable, :start]
end
