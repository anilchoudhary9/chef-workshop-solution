#
# Cookbook:: 2_Tomcat
# Recipe:: installTomcat
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Add Tomcat User
group 'tomcat' do
  action :create
end

# sudo mkdir /opt/tomcat
directory '/opt/tomcat'

# sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
user 'tomcat' do
  gid 'tomcat'
  shell '/bin/nologin'
  home '/opt/tomcat'
  action :create
end

# download tomcat install
# cd /tmp
# wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.78/bin/apache-tomcat-8.5.78.tar.gz

tomcat_file = '/tmp/apache-tomcat-8.5.78.tar.gz'

remote_file tomcat_file do
  source "#{node.default['2_Tomcat']['tomcat_source']}"
  action :create
end

# deploy tomcat file Extraction with strip components
execute 'extract_tomcat' do
  command 'sudo tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'
  cwd '/tmp'
end

# sudo chgrp -R tomcat /opt/tomcat
directory '/opt/tomcat' do
  group 'tomcat'
end

# sudo chmod -R g+r conf
# sudo chmod g+x conf
directory '/opt/tomcat/conf' do
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
end

# Change ownership to specific directories
# $ sudo chown -R tomcat webapps/ work/ temp/ logs/
# %w( webapps/ work/ temp/ logs/ bin/ lib/ conf/ ).each do |path|
#   directory "/opt/tomcat/#{path}" do
#     owner 'tomcat'
#     group 'tomcat'
#   end
# end

# execute 'update_permission' do
execute 'update_permission' do
  cwd '/opt/tomcat'
  command 'sudo chown -R tomcat webapps/ work/ temp/ logs/ bin/ lib/ conf/'
end
