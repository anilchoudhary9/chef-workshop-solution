#
# Cookbook:: 4_Bonus_Awesome_Appliance_Repair
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Update package managers
execute node.default['4_Bonus_Awesome_Appliance_Repair']['package_update_command']

apt_update

include_recipe '4_Bonus_Awesome_Appliance_Repair::apache'
include_recipe '4_Bonus_Awesome_Appliance_Repair::mysql'
include_recipe '4_Bonus_Awesome_Appliance_Repair::app'
