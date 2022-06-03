#
# Cookbook:: 3_Windows
# Recipe:: denyAdminStatus
#
# Copyright:: 2022, The Authors, All Rights Reserved.

windows_user_privilege 'Administrator' do
  privilege %w(SeBatchLogonRight)
  action :remove
end
