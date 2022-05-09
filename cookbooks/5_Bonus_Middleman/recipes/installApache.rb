#
# Cookbook:: 5_Bonus_Middleman
# Recipe:: installApache
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# apt-get install apache2
apt_package 'apache2'

# Configure apache2

# a2enmod proxy_http
execute 'proxy_http' do
  command 'sudo a2enmod proxy_http'
  not_if { ::File.exist?('/etc/apache2/mods-enabled/proxy_http.load') }
end

# a2enmod rewrite
execute 'proxy_http' do
  command 'sudo a2enmod rewrite'
  not_if { ::File.exist?('/etc/apache2/mods-enabled/rewrite.load') }
end

# cp blog.conf /etc/apache2/sites-enabled/blog.conf
template '/etc/apache2/sites-enabled/blog.conf' do
  source 'blog.conf.erb'
end

# rm /etc/apache2/sites-enabled/000-default.conf
file '/etc/apache2/sites-enabled/000-default.conf' do
  action :delete
  manage_symlink_source true
  only_if { ::File.exist?('/etc/apache2/sites-enabled/000-default.conf') }
end

# Restart apache
service 'apache2' do
  action :reload
end
