#
# Cookbook:: 3_Windows
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

include_recipe '3_Windows::networkLogonRights'

include_recipe '3_Windows::remoteInteractiveLogon'

include_recipe '3_Windows::denyAdminStatus'

include_recipe '3_Windows::disableCAD'

include_recipe '3_Windows::ntp-clinet'

include_recipe '3_Windows::ntp-server'
