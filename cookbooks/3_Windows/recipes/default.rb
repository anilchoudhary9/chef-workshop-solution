#
# Cookbook:: 3_Windows
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

include_recipe '1_Windows::networkLogonRights'

include_recipe '1_Windows::remoteInteractiveLogon'

include_recipe '1_Windows::denyAdminStatus'

include_recipe '1_Windows::disableCAD'

include_recipe '1_Windows::ntp-clinet'

include_recipe '1_Windows::ntp-server'
