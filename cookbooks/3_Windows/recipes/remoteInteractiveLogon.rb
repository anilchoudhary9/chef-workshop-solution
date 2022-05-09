#
# Cookbook:: 3_Windows
# Recipe:: remoteInteractiveLogon
#
# Copyright:: 2022, The Authors, All Rights Reserved.

windows_user_privilege 'Remote interactive logon' do
  privilege 'SeDenyRemoteInteractiveLogonRight'
  users     ['Builtin\Administrators', 'NT AUTHORITY\\Authenticated Users']
  action    :set
end
