#
# Cookbook:: 5_Bonus_Middleman
# Recipe:: thin
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# make working directory
directory 'middleman' do
  mode '0755'
  path '/var/www/middleman'
  action :create
end

template '/etc/init.d/thin' do
  source 'thin.erb'
  mode '0755'
  variables home_directory: '/var/www/middleman'
  # action :create_if_missing
end

# thin install /usr/sbin/update-rc.d -f thin defaults
execute 'thin install' do
  command '/usr/sbin/update-rc.d -f thin defaults'
end

# restart service
service 'thin' do
  action :restart
end

# deploy middleman
execute 'middleman deploy' do
  command 'sudo middleman init /var/www/middleman'
  not_if { ::File.exist?('/var/www/middleman/config.rb') }
end
