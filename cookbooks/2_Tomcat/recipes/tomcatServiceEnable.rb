#
# Cookbook:: 2_Tomcat
# Recipe:: tomcatServiceEnable
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Create and source Tomcat service
# sudo vi /etc/systemd/system/tomcat.service
template '/etc/systemd/system/tomcat.service' do
  source 'tomcat.service.erb'
end

# We can use template also
# cookbook_file '/etc/systemd/system/tomcat.service' do
#   source 'tomcat.service'
#   action :create_if_missing
# end

# start tomcat service
# sudo systemctl daemon-reload

service 'daemon-reload' do
  action :reload
end

# We can use this also
# systemd_unit 'daemon-reload' do
#   action :reload
# end

# sudo systemctl enable tomcat

service 'tomcat' do
  action [:enable, :start]
end

# Verify that Tomcat is running by visiting the site
# $ curl http://localhost:8080
