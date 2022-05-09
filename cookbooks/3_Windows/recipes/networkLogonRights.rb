#
# Cookbook:: 3_Windows
# Recipe:: networkLogonRights
#
# Copyright:: 2022, The Authors, All Rights Reserved.

windows_user_privilege 'Network Logon Rights' do
  privilege 'SeNetworkLogonRight'
  users     ['BUILTIN\Administrators']
  action    :set
end
