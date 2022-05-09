#
# Cookbook:: 3_Windows
# Recipe:: disableCAD
#
# Copyright:: 2022, The Authors, All Rights Reserved.

windows_user_privilege 'Interactive logon: Do not require CTRL+ALT+DEL' do
  privilege  'DisableCAD'
  users      ['NT AUTHORITY\\Authenticated Users']
  action     :set
end
