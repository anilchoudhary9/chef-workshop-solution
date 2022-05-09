#
# Cookbook:: 3_Windows
# Recipe:: ntp-server
#
# Copyright:: 2022, The Authors, All Rights Reserved.

windows_service 'w32time-server' do
  action disable: true
end
