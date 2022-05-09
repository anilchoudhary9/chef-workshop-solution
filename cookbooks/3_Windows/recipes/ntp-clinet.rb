#
# Cookbook:: 3_Windows
# Recipe:: ntp-clinet
#
# Copyright:: 2022, The Authors, All Rights Reserved.

windows_service 'w32time-client' do
  action disable: true
end
