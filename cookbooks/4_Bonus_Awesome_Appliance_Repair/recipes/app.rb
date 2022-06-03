#
# Cookbook:: 4_Bonus_Awesome_Appliance_Repair
# Recipe:: app
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Location of zip file
repo_source = node.default['4_Bonus_Awesome_Appliance_Repair']['repo_source']

# Grabs zip file from source location

master_file = '/tmp/master.zip'

remote_file master_file do
  source repo_source
  owner 'root'
  mode '0644'
  action :create_if_missing
end

# Unzip the package this method can be used with newer chef version
# archive_file 'master.zip' do
#   path "/tmp/master.zip"
#   # destination '/var/www/'
#   not_if{ ::File.directory?'/Awesome-Appliance-Repair-master'}
#   action :extract
# end

# Unzip the package
# execute 'unzip' do
#   command 'unzip /tmp/master.zip'
# end
package 'unzip' do
  action :install
end

execute 'extract_master' do
  command 'sudo unzip /tmp/master.zip'
end

# Move the web files to the proper /www/ location
execute 'move_AAR_dir' do
  command 'sudo mv Awesome-Appliance-Repair-Master-master/AAR /var/www/'
end
# Make sure script has execute permissions
# execute 'chmod_script_file' do
#   cwd '/Awesome-Appliance-Repair-Master'
#   command "chmod +x #{node.default['4_Bonus_Awesome_Appliance_Repair']['script_to_run']}"
# end

file "/var/www/AAR/#{node.default['4_Bonus_Awesome_Appliance_Repair']['script_to_run']}" do
  mode '777'
end

# MySQL password
mysql_pass = node.default['4_Bonus_Awesome_Appliance_Repair']['mysql_root_pass']

# Execute installer script
execute "./#{node.default['4_Bonus_Awesome_Appliance_Repair']['script_to_run']} #{mysql_pass}" do
  cwd '/var/www/AAR/'
end

# execute
execute 'apachectl graceful'

execute 'run_init_script' do
  command 'python3 /var/www/AAR/AARinstall.py password'
end
