#
# Cookbook:: 3_Windows
# Recipe:: denyAdminStatus
#
# Copyright:: 2022, The Authors, All Rights Reserved.

windows_user_privilege 'Accounts: Administrator account status' do
  privilege     'SeDenyAdminStatus'
  users         ['Builtin\Administrators', 'NT AUTHORITY\\Authenticated Users']
  action        :clear
end
